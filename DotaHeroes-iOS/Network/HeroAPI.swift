//
//  HeroAPI.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 06/05/2023.
//

import Foundation

class HeroAPI {
		private let api: API<[Hero]>
		
		init(api: API<[Hero]> = API<[Hero]>()) {
				self.api = api
		}
		
		func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
				api.request(endpoint: "heroStats", method: .get, completion: completion)
		}
}
