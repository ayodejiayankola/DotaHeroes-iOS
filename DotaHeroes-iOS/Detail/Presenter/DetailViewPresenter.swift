//
//  DetailViewPresenter.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation
protocol DetailViewPresenterProtocol {
	func getHero() -> Hero?
}

class DetailViewPresenter: DetailViewPresenterProtocol {
	private let hero: Hero?
	
	init(hero: Hero?) {
		self.hero = hero
	}
	
	func getHero() -> Hero? {
		return hero
	}
}
