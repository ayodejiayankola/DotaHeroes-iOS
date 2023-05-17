//
//  MainViewPresenter.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation
import RealmSwift

protocol MainViewPresenterProtocol {
	func fetchHeroes(completion: @escaping (Result<Void, APIError>) -> Void)
	func getHeroes() -> Results<Hero>?
}


class MainViewPresenter: MainViewPresenterProtocol {
	
	private let heroAPI: HeroAPI
	private var heroes: [Hero] = [] 
	
	init(heroAPI: HeroAPI) {
		self.heroAPI = heroAPI
	}
	
	func fetchHeroes(completion: @escaping (Result<Void, APIError>) -> Void) {
		heroAPI.fetchHeroes { result in
			switch result {
			case .success(let fetchedHeroes):
				do {
					let realm = try Realm()
					try realm.write {
						realm.add(fetchedHeroes, update: .modified)
					}
					completion(.success(()))
				} catch {
					completion(.failure(.realmError))
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	func getHeroes() -> Results<Hero>? {
		let realm = try? Realm()
		return realm?.objects(Hero.self)
	}
}
