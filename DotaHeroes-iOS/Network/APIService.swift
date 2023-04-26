//
//  APIService.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation


protocol APIService {
		func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void)
}

class APIServiceImpl: APIService {
		private let baseURL: URL
		private let session: URLSession
		
		init(baseURL: URL, session: URLSession) {
				self.baseURL = baseURL
				self.session = session
		}
		
		func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
				guard let url = URL(string: "heroStats", relativeTo: baseURL) else {
						completion(.failure(.invalidURL))
						return
				}
				
				let task = session.dataTask(with: url) { data, response, error in
						if let error = error {
								completion(.failure(.requestError(error)))
								return
						}
						
						guard let httpResponse = response as? HTTPURLResponse,
									200..<300 ~= httpResponse.statusCode,
									let data = data else {
								completion(.failure(.invalidResponse))
								return
						}
						
						do {
								let heroes = try JSONDecoder().decode([Hero].self, from: data)
								completion(.success(heroes))
						} catch {
								completion(.failure(.decodingError))
						}
				}
				
				task.resume()
		}
}




