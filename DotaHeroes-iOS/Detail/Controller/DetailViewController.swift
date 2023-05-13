//
//  DetailViewController.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import UIKit

class DetailViewController: UIViewController {
	
	let detailView: DetailView
	let detailViewPresenter: DetailViewPresenterProtocol
	
	init(detailView: DetailView, detailViewPresenter: DetailViewPresenterProtocol) {
		self.detailView = detailView
		self.detailViewPresenter = detailViewPresenter
		super.init(nibName: nil, bundle: nil)
		view.backgroundColor = UIColor(named: "#2A3039")
		setupProperties()
		view.addSubview(detailView)
		detailView.fillSuperview()
		configureDetailView()
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	private func setupProperties() {
		navigationItem.title = "Hero Details"
	}
	
	private func configureDetailView() {
		if let hero = detailViewPresenter.getHero() {
			detailView.configure(with: hero)
		}
	}
	
}
