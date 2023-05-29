//
//  DetailViewPresenterTests.swift
//  DotaHeroes-iOSTests
//
//  Created by Ayodeji Ayankola on 29/05/2023.
//

import XCTest
@testable import DotaHeroes_iOS

class DetailViewPresenterTests: XCTestCase {
	var mockViewPresenterProtocol: MockDetailViewPresenterProtocol!
	
	override func setUp() {
		super.setUp()
		
		mockViewPresenterProtocol = MockDetailViewPresenterProtocol()
	}
	
	override func tearDown() {
		mockViewPresenterProtocol = nil
		super.tearDown()
	}
	
	func testGetHero() {
		// Arrange
		let expectedHero = createDummyHero()
		mockViewPresenterProtocol.hero = expectedHero
		
		// Act
		let hero = mockViewPresenterProtocol.getHero()
		
		// Assert
		XCTAssertEqual(hero?.id, expectedHero?.id, "Hero id should match")
		XCTAssertEqual(hero?.name, expectedHero?.name, "Hero name should match")
		XCTAssertEqual(hero?.localizedName, expectedHero?.localizedName, "Hero localized name should match")
		XCTAssertEqual(hero?.primaryAttribute, expectedHero?.primaryAttribute, "Hero primary attribute should match")
		XCTAssertEqual(hero?.attackType, expectedHero?.attackType, "Hero attack type should match")
		XCTAssertEqual(hero?.roles, expectedHero?.roles, "Hero roles should match")
		XCTAssertEqual(hero?.heroImageURL, expectedHero?.heroImageURL, "Hero image URL should match")
		XCTAssertEqual(hero?.legs, expectedHero?.legs, "Hero legs should match")
	}
	
	func createDummyHero() -> Hero? {
		// Create a dummy Hero object for testing
		let dummyHero = Hero(id: 1, name: "Test Hero", localizedName: "Test Localized Name", primaryAttribute: "Strength", attackType: "Melee", roles: ["Tank"], heroImageURL: "https://example.com/image.jpg", legs: 2)
		return dummyHero
	}
	
	func testGetHero_WhenHeroIsNil_ShouldReturnNil() {
		// Arrange
		mockViewPresenterProtocol.hero = nil
		
		// Act
		let hero = mockViewPresenterProtocol.getHero()
		
		// Assert
		XCTAssertNil(hero, "Hero should be nil when the mock hero is nil")
	}
	
}

