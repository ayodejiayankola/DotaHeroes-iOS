//
//  MainView.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import Foundation

import UIKit

class MainView: UIView {
	
	let tableView = UITableView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		constraintSetup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func constraintSetup(){
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: topAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
