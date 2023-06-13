//
//  APIError.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation

enum APIError: Error, Equatable {
	case invalidURL
	case invalidResponse
	case decodingError
	case serverError(String)
	case requestFailed(Error)
	
	static func ==(lhs: APIError, rhs: APIError) -> Bool {
		switch (lhs, rhs) {
		case (.invalidURL, .invalidURL),
			(.invalidResponse, .invalidResponse),
			(.decodingError, .decodingError):
			return true
		case let (.serverError(lhsMessage), .serverError(rhsMessage)):
			return lhsMessage == rhsMessage
		case let (.requestFailed(lhsError), .requestFailed(rhsError)):
			return lhsError.localizedDescription == rhsError.localizedDescription
		default:
			return false
		}
	}
}
