//
//  LookupTest.swift
//  OpenAPIClient
//
//  Created by Charles du Jeu on 16/12/2024.
//

import XCTest
import OpenAPIClient // Import your generated SDK

class OpenApiClientTests: XCTestCase {
    func testLookup() throws {
        // Create an instance of the API client
        let apiClient = OpenApiClient(baseURL: "https://local.pydio:8080/a") // Adjust as needed
        
        // Define an expectation for the async call
        let expectation = self.expectation(description: "Fetch resources from API")
        
        // Call the API method to fetch resources
        apiClient.fetchResources { result in
            switch result {
            case .success(let resources):
                // Assert that the response contains the expected data
                XCTAssertNotNil(resources, "Resources should not be nil")
                XCTAssertGreaterThan(resources.count, 0, "Resources should not be empty")
                
                // Example: Print resource names
                resources.forEach { resource in
                    print("Resource: \(resource.name)")
                }
                
            case .failure(let error):
                // If the request fails, fail the test
                XCTFail("API call failed with error: \(error.localizedDescription)")
            }
            
            // Fulfill the expectation to let the test proceed
            expectation.fulfill()
        }
        
        // Wait for the async call to complete
        waitForExpectations(timeout: 10) // Adjust timeout as needed
    }
}
