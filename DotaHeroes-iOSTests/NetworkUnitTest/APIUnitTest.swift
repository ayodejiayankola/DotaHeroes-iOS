//
//  APIUnitTest.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 23/05/2023.
//

import XCTest
@testable import DotaHeroes_iOS

final class APIUnitTest: XCTestCase {
	
	var api: API<Hero>!
	var mockSession: MockURLSession!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		
		let config = URLSessionConfiguration.ephemeral
		config.protocolClasses = [MockURLProtocol.self]
		let urlSession = URLSession(configuration: config)
		
		api = API(baseURL: "https://api.opendota.com/api", session: urlSession)
		
		mockSession = urlSession as? MockURLSession
	}
	
	override func tearDownWithError() throws {
		api = nil
		mockSession = nil
		
		try super.tearDownWithError()
	}
	
	func testAPIRequest_Success() {
		// Arrange
		let api = API<[Hero]>(baseURL: "https://api.opendota.com/api")
		let expectation = self.expectation(description: "API request expectation")
		
		var receivedResult: Result<[Hero], APIError>?
		
		// Act
		api.request(endpoint: "heroStats", method: .get) { result in
			receivedResult = result
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 5)
		
		// Assert
		switch receivedResult {
		case .success(let heroes):
			XCTAssertFalse(heroes.isEmpty, "Received empty list of heroes")
		case .failure(let error):
			XCTFail("Received API error: \(error.localizedDescription)")
		default:
			XCTFail("Unexpected result received")
		}
	}
	
	func testAPIRequest_Failure_InvalidURL() {
		// Arrange
		let expectation = self.expectation(description: "Invalid URL expectation")
		var receivedError: APIError?
		
		// Act
		api.request(endpoint: "invalidEndpoint", method: .get) { result in
			switch result {
			case .failure(let error):
				receivedError = error
			default:
				XCTFail("Unexpected result received")
			}
			expectation.fulfill()
		}
		
		// Assert
		waitForExpectations(timeout: 2, handler: nil)
		
		if case .requestFailed = receivedError {
			// The error type is .requestFailed
			XCTAssertTrue(receivedError != nil)
		} else {
			XCTFail("Unexpected error case received")
		}
	}
}
