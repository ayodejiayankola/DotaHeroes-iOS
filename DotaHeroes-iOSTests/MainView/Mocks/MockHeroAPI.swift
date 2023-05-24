//
//  MockHeroAPI.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 24/05/2023.
//

import XCTest
@testable import DotaHeroes_iOS

class MockHeroAPI: HeroAPI {
		var fetchHeroesCalled = false
		
		override func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
				fetchHeroesCalled = true
				
				let mockHeroesData = """
				[{
						"id": 1,
						"name": "npc_dota_hero_antimage",
						"localized_name": "Anti-Mage",
						"primary_attr": "agi",
						"attack_type": "Melee",
						"roles": ["Carry", "Escape", "Nuker"],
						"img": "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/antimage.png?",
						"legs": 2
				}, {
						"id": 2,
						"name": "npc_dota_hero_axe",
						"localized_name": "Axe",
						"primary_attr": "str",
						"attack_type": "Melee",
						"roles": ["Initiator", "Durable", "Disabler", "Carry"],
						"img": "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/axe.png?",
						"legs": 2
				}]
				""".data(using: .utf8)!
				
				let decoder = JSONDecoder()
				
				do {
						let heroes = try decoder.decode([Hero].self, from: mockHeroesData)
						completion(.success(heroes))
				} catch {
						completion(.failure(.decodingError))
				}
		}
}
