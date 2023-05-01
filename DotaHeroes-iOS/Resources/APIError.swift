//
//  APIError.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation

enum APIError: Error {
		case invalidURL
		case invalidResponse
		case decodingError
		case serverError(String)
}
