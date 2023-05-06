//
//  ViewController.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 25/04/2023.
//

import UIKit

class ViewController: UIViewController {
	
	private let api = API<[Hero]>()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchHeroes()
	}
	
	private func fetchHeroes() {
		api.request(endpoint: "heroStats", method: .get) { result in
			switch result {
			case .success(let heroes):
				print(heroes)
			case .failure(let error):
				print(error)
			}
		}
	}
}

