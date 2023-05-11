//
//  MainViewPresenter.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation

protocol MainViewPresenterProtocol {
	func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void)
}

class MainViewPresenter: MainViewPresenterProtocol {
	private let heroAPI: HeroAPI
	
	init(heroAPI: HeroAPI) {
		self.heroAPI = heroAPI
	}
	
	func fetchHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
		heroAPI.fetchHeroes(completion: completion)
	}
}
