//
//  LookupTest.swift
//  OpenAPIClient
//
//  Created by Charles du Jeu on 16/12/2024.
//

import XCTest
import CellsSDK

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
        let baseURL = (ProcessInfo.processInfo.environment["API_URL"] ?? "") + "/a"
        let secretKey = ProcessInfo.processInfo.environment["API_TOKEN"] ?? ""
        let rootPath = ProcessInfo.processInfo.environment["API_ROOT_PATH"] ?? "/common-files"
        
        if baseURL == "" || secretKey == "" {
            XCTFail("Skipping testLookup as environment variables API_URL and API_SECRET_KEY must be set")
            return
        }
        
        // Create an instance of the API client
        // Must be performed on http, or on trusted certif https
        let apiConfig = CellsSDKAPIConfiguration(basePath: baseURL, customHeaders: ["Authorization" : "Bearer "+secretKey]) // Adjust as needed
 
        // Define an expectation for the async call
        let expectation = self.expectation(description: "Fetch resources from API")
        let request = RestLookupRequest()
        let locator = RestNodeLocator(path:rootPath + "/*")
        request.locators = RestNodeLocators(many: [locator])
        let requestBuilder = NodeServiceAPI.lookupWithRequestBuilder(body: request, apiConfiguration: apiConfig)
        
        requestBuilder.execute{ result in
            switch result {
            case .success(let value):
                XCTAssertNotNil(value)
                let collection = value.body
                collection.nodes.forEach { node in
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
}
