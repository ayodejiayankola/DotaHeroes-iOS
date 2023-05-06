//
//  API.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation

class API<T: Decodable>: APIProtocol {
	typealias ResponseType = T
	
	private let baseURL: String
	private let session: URLSession
	
	init(baseURL: String = Constants.apiBaseURL, session: URLSession = URLSession.shared) {
		self.baseURL = baseURL
		self.session = session
	}
	
	func request(endpoint: String, method: HTTPMethod, completion: @escaping (Result<ResponseType, APIError>) -> Void) {
		guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
			completion(.failure(.invalidURL))
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue
		
		let task = session.dataTask(with: request) { data, response, error in
			if let error = error {
				completion(.failure(.requestFailed(error)))
				return
			}
			
			guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completion(.failure(.invalidResponse))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let result = try decoder.decode(ResponseType.self, from: data)
				print("my result \(result)")
				completion(.success(result))
			} catch {
				completion(.failure(.decodingError))
			}
		}
		
		task.resume()
	}
}
