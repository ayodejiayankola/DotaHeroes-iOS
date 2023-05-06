//
//  APIProtocol.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 06/05/2023.
//

import Foundation

protocol APIProtocol {
		associatedtype ResponseType: Decodable
		
		func request(endpoint: String, method: HTTPMethod, completion: @escaping (Result<ResponseType, APIError>) -> Void)
}
