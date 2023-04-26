//
//  Hero.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation

struct Hero: Codable {
	let id: Int
	let name: String
	let localizedName: String
	let primaryAttribute: String
	let attackType: String
	let roles: [String]
	let heroImageURL: String
	let legs: String
	
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
}
