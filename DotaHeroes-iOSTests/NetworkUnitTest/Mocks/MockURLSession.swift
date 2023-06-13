//
//  MockURLSession.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 13/06/2023.
//

import Foundation

class MockURLSession: URLSession {
	typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
	
	var data: Data?
	var response: URLResponse?
	var error: Error?
	var completionHandler: CompletionHandler?
	
	override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		self.completionHandler = completionHandler
		return URLSessionDataTaskMock(session: self, request: request)
	}
}

class URLSessionDataTaskMock: URLSessionDataTask {
	private let session: MockURLSession
	private let request: URLRequest
	
	init(session: MockURLSession, request: URLRequest) {
		self.session = session
		self.request = request
		super.init()
	}
	
	override func resume() {
		DispatchQueue.main.async {
			self.mockCompletionHandler()
		}
	}
	
	private func mockCompletionHandler() {
		session.completionHandler?(nil, nil, nil)
	}
}
