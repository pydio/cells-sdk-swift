//
//  LookupTest.swift
//  OpenAPIClient
//
//  Created by Charles du Jeu on 16/12/2024.
//

import XCTest
import OpenAPIClient // Import your generated SDK

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

class OpenApiClientTests: XCTestCase {
    @MainActor func testLookup() throws {
        let basePath = "http://local.pydio:8383/a"
        let secretKey = "7s33M-RAYDmiNvXLIS5LIMlyeeju9dYb9MJgK-2js64.89z8xHJc7UmDC9U9fFj-JzZIhQ6AuPXJzPbrDn74kT8" //         // Create an instance of the API client
        let apiConfig = OpenAPIClientAPIConfiguration(basePath: basePath, customHeaders: ["Authorization" : "Bearer "+secretKey]) // Adjust as needed
 
        // Define an expectation for the async call
        let expectation = self.expectation(description: "Fetch resources from API")
        let request = RestLookupRequest()
        let locator = RestNodeLocator(path:"/structured/*")
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
