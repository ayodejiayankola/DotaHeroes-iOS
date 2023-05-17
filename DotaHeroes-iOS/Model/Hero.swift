//
//  Hero.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation
import RealmSwift

class Hero: Object, Codable {
		@Persisted(primaryKey: true) var id: Int?
		@Persisted var name: String?
		@Persisted var localizedName: String?
		@Persisted var primaryAttribute: String?
		@Persisted var attackType: String?
  	@Persisted var roles: List<Optional<String>> = List<Optional<String>>()
		@Persisted var heroImageURL: String?
		@Persisted var legs: Int?
		
		enum CodingKeys: String, CodingKey {
				case id
				case name
				case localizedName = "localized_name"
				case primaryAttribute = "primary_attr"
				case attackType = "attack_type"
				case roles
				case heroImageURL = "img"
				case legs
		}
		
		// MARK: - Codable Conformance
		
  	required override init() {
				super.init()
		}

	required init(from decoder: Decoder) throws {
			super.init()
			let container = try decoder.container(keyedBy: CodingKeys.self)
			id = try container.decodeIfPresent(Int.self, forKey: .id)
			name = try container.decodeIfPresent(String.self, forKey: .name)
			localizedName = try container.decodeIfPresent(String.self, forKey: .localizedName)
			primaryAttribute = try container.decodeIfPresent(String.self, forKey: .primaryAttribute)
			attackType = try container.decodeIfPresent(String.self, forKey: .attackType)
		if let rolesOptional = try container.decodeIfPresent([String]?.self, forKey: .roles) {
				roles.append(objectsIn: rolesOptional?.compactMap { $0 } ?? [])
		}
		
			heroImageURL = try container.decodeIfPresent(String.self, forKey: .heroImageURL)
			legs = try container.decodeIfPresent(Int.self, forKey: .legs)
	}

		
		func encode(to encoder: Encoder) throws {
				var container = encoder.container(keyedBy: CodingKeys.self)
				try container.encodeIfPresent(id, forKey: .id)
				try container.encodeIfPresent(name, forKey: .name)
				try container.encodeIfPresent(localizedName, forKey: .localizedName)
				try container.encodeIfPresent(primaryAttribute, forKey: .primaryAttribute)
				try container.encodeIfPresent(attackType, forKey: .attackType)
				try container.encodeIfPresent(roles, forKey: .roles)
				try container.encodeIfPresent(heroImageURL, forKey: .heroImageURL)
				try container.encodeIfPresent(legs, forKey: .legs)
		}
}
