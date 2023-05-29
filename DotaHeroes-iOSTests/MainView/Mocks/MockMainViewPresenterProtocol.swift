//
//  MockMainViewPresenterProtocol.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 29/05/2023.
//

@testable import DotaHeroes_iOS

class MockMainViewPresenterProtocol: MainViewPresenterProtocol {
	var heroAPI: HeroAPI!
	
	func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
		heroAPI.fetchHeroes(completion: completion)
	}
}
