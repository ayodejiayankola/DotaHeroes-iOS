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
	
	init(mainView: MainView) {
		self.mainView = mainView
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mainView.tableView.dataSource = self
		mainView.tableView.delegate = self
		view.addSubview(mainView)
		constraintSetup()
		setupProperties()
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
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = "Cell \(indexPath.row + 1)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let detailView = DetailView()
		let detailViewController = DetailViewController(detailView: detailView)
		navigationController?.pushViewController(detailViewController, animated: true)
	}
}
