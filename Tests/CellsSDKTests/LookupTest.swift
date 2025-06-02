//
//  LookupTest.swift
//  OpenAPIClient
//
//  Created by Charles du Jeu on 16/12/2024.
//

import XCTest
import CellsSDK
import AWSClientRuntime
import AWSSDKIdentity
import AWSS3
import Smithy
import ClientRuntime

func printNodeAsJSON(node: RestNode) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted // Optional: Makes the JSON output easier to read
    do {
        let jsonData = try encoder.encode(node)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print("Failed to encode node to JSON: \(error)")
    }
}

actor OneTimeSetup {
    static private var complete = false

    static let shared = OneTimeSetup()

    static func perform() async {
        guard !complete else { return }
        complete = true

        await SDKLoggingSystem().initialize(logLevel: .trace)
    }
}

class CellsSDKTests: XCTestCase {
    enum Constants {
        /// The threshold in bytes when the AWS SDK uses chunked encoding for uploads.
        static let awsChunkedEncodingThreshold = 65_536 * 16
        static let smallFileURL = URL.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).txt")
        static let largeFileURL = URL.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).txt")
    }

    override func setUp() async throws {
        await OneTimeSetup.perform()

        // Create a small file with random data
        let smallData = String(repeating: "a", count: Constants.awsChunkedEncodingThreshold - 1).data(using: .utf8)!
        try smallData.write(to: Constants.smallFileURL)

        // Create a large file with random data
        let largeData = String(repeating: "b", count: Constants.awsChunkedEncodingThreshold).data(using: .utf8)!
        try largeData.write(to: Constants.largeFileURL)
    }

    override func tearDown() async throws {
        for url in [Constants.smallFileURL, Constants.largeFileURL] {
            try FileManager.default.removeItem(at: url)
        }
    }

    @MainActor func testLookup() throws {
        let baseURL = (ProcessInfo.processInfo.environment["API_URL"] ?? "") + "/v2"
        let secretKey = ProcessInfo.processInfo.environment["API_TOKEN"] ?? ""
        let rootPath = ProcessInfo.processInfo.environment["API_ROOT_PATH"] ?? "common-files"
        
        if baseURL == "" || secretKey == "" {
            XCTFail("Skipping testLookup as environment variables API_URL and API_SECRET_KEY must be set")
            return
        }
        
        // Create an instance of the API client
        // Must be performed on http, or on trusted certif https
        let apiConfig = CellsSDKAPIConfiguration(basePath: baseURL, customHeaders: ["Authorization" : "Bearer "+secretKey]) // Adjust as needed
 
        // Define an expectation for the async call
        let expectation = self.expectation(description: "Fetch resources from API")
        let locator = RestNodeLocator(path:rootPath + "/*")
        let request = RestLookupRequest(flags: [.withVersionsPublished, .withVersionsAll], locators:RestNodeLocators(many: [locator]))
        let requestBuilder = NodeServiceAPI.lookupWithRequestBuilder(body: request, apiConfiguration: apiConfig)
        
        requestBuilder.execute{ result in
            switch result {
            case .success(let value):
                XCTAssertNotNil(value)
                let collection = value.body
                collection.nodes?.forEach { node in
                    XCTAssertNotNil(node.path)
                    printNodeAsJSON(node: node)
                }
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            // Fulfill the expectation to let the test proceed
            expectation.fulfill()
        }
        
                
        // Wait for the async call to complete
        waitForExpectations(timeout: 3) // Adjust timeout as needed
    }


    @MainActor func testUpload() throws {
        struct TestCase {
            let key: String
            let size: Int
            let fileHandle: FileHandle
        }

        let testCases: [TestCase] = [
          TestCase(key: "random-ios-small.txt", size: Constants.awsChunkedEncodingThreshold-1, fileHandle: try FileHandle(forReadingFrom: Constants.smallFileURL)),
          TestCase(key: "random-ios-large.txt", size: Constants.awsChunkedEncodingThreshold, fileHandle: try FileHandle(forReadingFrom: Constants.largeFileURL)),
        ]

        let baseURL = (ProcessInfo.processInfo.environment["API_URL"] ?? "")
        let secretKey = ProcessInfo.processInfo.environment["API_TOKEN"] ?? ""
        let rootPath = ProcessInfo.processInfo.environment["API_ROOT_PATH"] ?? "common-files"

        let identity = try StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: secretKey, secret: "gatewaysecret"))
        let BUCKET = "io"

        let configuration = try S3Client.S3ClientConfiguration()
        configuration.region = "us-east-1"
        configuration.signingRegion = "us-east-1"
        configuration.forcePathStyle = true
        configuration.endpoint = baseURL
        configuration.clientLogMode = ClientLogMode.requestWithBody
        configuration.requestChecksumCalculation = .whenSupported
        configuration.responseChecksumValidation = .whenSupported
        
        configuration.awsCredentialIdentityResolver = identity

        let client = S3Client(config: configuration)

        
        for testCase in testCases {
            var statBuf = stat()
            if fstat(testCase.fileHandle.fileDescriptor, &statBuf) == 0 {
                let fileSize = statBuf.st_size
                print("File size: \(fileSize) bytes")
                let input = PutObjectInput(
                    body: .from(fileHandle: testCase.fileHandle),
                    bucket: BUCKET,
                    //contentLength: Int(fileSize),
                    
                    key: rootPath + "/" + testCase.key
                )
                let expectation = self.expectation(description: "Upload \(testCase.key)")

                Task {
                    do {
                        _ = try await client.putObject(input: input)
                    } catch {
                        print("ERROR: ", dump(error, name: "Putting an object."))
                        XCTFail("Failed to put object: \(testCase.key), \(error)")
                    }
                    expectation.fulfill()
                }

                // Wait for the async call to complete
                waitForExpectations(timeout: 5) // Adjust timeout as needed
            } else {
                perror("fstat failed")
            }

        }
    }
}
