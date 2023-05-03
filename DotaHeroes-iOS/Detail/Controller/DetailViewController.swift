//
//  DetailViewController.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import UIKit

class DetailViewController: UIViewController {
	
	let detailView: DetailView
	
	init(detailView: DetailView) {
		self.detailView = detailView
		super.init(nibName: nil, bundle: nil)
		view.backgroundColor = UIColor(named: "#2A3039")
		title = "Detailed"
		view.addSubview(detailView)
		detailView.fillSuperview()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
