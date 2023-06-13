//
//  MOCKURLProtocol.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 13/06/2023.
//

import Foundation

class MockURLProtocol: URLProtocol {
	static var stubResponseData: Data?
	static var error: Error?
	
	override class func canInit(with request: URLRequest) -> Bool {
		return true
	}
	
	override class func canonicalRequest(for request: URLRequest) -> URLRequest {
		return request
	}
	
	override func startLoading() {
		if let error = MockURLProtocol.error {
			client?.urlProtocol(self, didFailWithError: error)
		} else if let responseData = MockURLProtocol.stubResponseData {
			client?.urlProtocol(self, didReceive: URLResponse(), cacheStoragePolicy: .notAllowed)
			client?.urlProtocol(self, didLoad: responseData)
		} else {
			client?.urlProtocol(self, didFailWithError: NSError(domain: NSURLErrorDomain, code: NSURLErrorUnknown, userInfo: nil))
		}
		
		client?.urlProtocolDidFinishLoading(self)
	}
	
	override func stopLoading() {
		// No implementation needed for this mock
	}
}
