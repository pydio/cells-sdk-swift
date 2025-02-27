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

class CellsSDKTests: XCTestCase {
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
        let baseURL = (ProcessInfo.processInfo.environment["API_URL"] ?? "")
        let secretKey = ProcessInfo.processInfo.environment["API_TOKEN"] ?? ""
        let rootPath = ProcessInfo.processInfo.environment["API_ROOT_PATH"] ?? "common-files"

        let identity = try StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: secretKey, secret: "gatewaysecret"))
        let BUCKET = "io"
        let TEST_KEY = "random-ios.txt"

        let configuration = try S3Client.S3ClientConfiguration()
        configuration.region = "us-east-1"
        configuration.signingRegion = "us-east-1"
        configuration.forcePathStyle = true
        configuration.endpoint = baseURL
        
        configuration.awsCredentialIdentityResolver = identity

        let client = S3Client(config: configuration)
        

        let data: Data? = "The random data contents".data(using: .utf8)
        let dataStream = ByteStream.data(data)

        let input = PutObjectInput(
            body: dataStream,
            bucket: BUCKET,
            key: rootPath + "/" + TEST_KEY
        )
        let expectation = self.expectation(description: "Upload a basic file")

        Task {
            do {
                await SDKLoggingSystem().initialize(logLevel: .trace)
                _ = try await client.putObject(input: input)
            }
            catch {
                print("ERROR: ", dump(error, name: "Putting an object."))
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }

        // Wait for the async call to complete
        waitForExpectations(timeout: 5) // Adjust timeout as needed

    }
}
