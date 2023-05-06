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
		let viewController = MainViewController(mainView: view)
		return viewController
	}
}


//class DependencyContainer {
//	func makeInitialViewController() -> ViewController {
//		let viewController = ViewController()
//		return viewController
//	}
//}
