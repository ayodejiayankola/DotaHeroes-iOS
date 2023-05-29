//
//  MockDetailViewPresenterProtocol.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 29/05/2023.
//

@testable import DotaHeroes_iOS

class MockDetailViewPresenterProtocol: DetailViewPresenterProtocol {
	var hero: Hero?
	
	func getHero() -> Hero? {
		return hero
	}
}
