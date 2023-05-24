//
//  MainViewPresenterTests.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 24/05/2023.
//

import XCTest
@testable import DotaHeroes_iOS


class MainViewPresenterTests: XCTestCase {

		
		var presenter: MainViewPresenter!
		var mockHeroAPI: MockHeroAPI!
		
		override func setUp() {
				super.setUp()
				
				mockHeroAPI = MockHeroAPI()
				presenter = MainViewPresenter(heroAPI: mockHeroAPI)
		}
		
		override func tearDown() {
				presenter = nil
				mockHeroAPI = nil
				
				super.tearDown()
		}
		
		func testFetchHeroes_ShouldCallFetchHeroesOnHeroAPI() {
				// Act
				presenter.fetchHeroes { _ in }
				
				// Assert
				XCTAssertTrue(mockHeroAPI.fetchHeroesCalled, "fetchHeroes should be called on HeroAPI")
		}
		
		func testFetchHeroes_ShouldReturnMockHeroes() {
				// Arrange
				var fetchedHeroes: [Hero] = []
				
				// Act
				presenter.fetchHeroes { result in
						switch result {
						case .success(let heroes):
								fetchedHeroes = heroes
						case .failure:
								XCTFail("fetchHeroes should not fail")
						}
				}
				
				// Assert
				XCTAssertEqual(fetchedHeroes.count, 2, "Expected 2 heroes to be fetched")
				XCTAssertEqual(fetchedHeroes[0].name, "npc_dota_hero_antimage", "Unexpected hero name")
			XCTAssertEqual(fetchedHeroes[1].localizedName, "Axe", "Unexpected hero name")
		}
		
		// Add more test methods as needed
		
}
