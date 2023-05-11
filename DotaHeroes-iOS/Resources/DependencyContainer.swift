//
//  DependencyContainer.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 26/04/2023.
//

import Foundation

import UIKit

class DependencyContainer {
	func makeInitialViewController() -> MainViewController {
		let view = MainView()
		let presenter = MainViewPresenter(heroAPI: HeroAPI())
		let viewController = MainViewController(mainView: view, mainViewPresenter: presenter)
		return viewController
	}
}
