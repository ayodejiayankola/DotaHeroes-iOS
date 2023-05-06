//
//  ViewController.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 25/04/2023.
//

import UIKit

class ViewController: UIViewController {
	
	let heroAPI = HeroAPI()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchHeroes()
	}
	
	private func fetchHeroes() {

		heroAPI.fetchHeroes { result in
				switch result {
				case .success(let heroes):
						print("Fetched \(heroes) heroes!")
				case .failure(let error):
						print("Error fetching heroes: \(error)")
				}
		}
	}
}

