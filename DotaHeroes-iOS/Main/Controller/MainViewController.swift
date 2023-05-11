//
//  MainViewController.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
	
	let mainView: MainView
	private let mainViewPresenter: MainViewPresenterProtocol
	private var heroes: [Hero] = []
	
	init(mainView: MainView, mainViewPresenter: MainViewPresenterProtocol) {
		self.mainView = mainView
		self.mainViewPresenter = mainViewPresenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
		mainView.tableView.rowHeight = 120
		mainView.tableView.dataSource = self
		mainView.tableView.delegate = self
		view.addSubview(mainView)
		constraintSetup()
		setupProperties()
		mainViewPresenter.fetchHeroes { result in
			switch result {
			case .success(let heroes):
				self.heroes = heroes
				DispatchQueue.main.async {
					self.mainView.tableView.reloadData()
				}
			case .failure(let error):
				// Handle the error here
				print("Failed to fetch heroes data: \(error)")
			}
		}
	}
	
	private func constraintSetup(){
		mainView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainView.topAnchor.constraint(equalTo: view.topAnchor),
			mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	private func setupProperties() {
		navigationItem.title = "Main View of Dota Hero"
	}
	
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return heroes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as! MainTableViewCell
		let hero = heroes[indexPath.row]
		let heroImage = Constants.imageBaseURL+(hero.heroImageURL ?? "")
		cell.configure(imageURL: heroImage, text: hero.name ?? "No Localised Name")
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let detailView = DetailView()
		let detailViewController = DetailViewController(detailView: detailView)
		navigationController?.pushViewController(detailViewController, animated: true)
	}
}
