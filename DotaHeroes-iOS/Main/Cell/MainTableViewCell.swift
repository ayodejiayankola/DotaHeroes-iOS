//
// MainTableViewCell.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 04/05/2023.
//

import Foundation
import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell,ReusableCell {
	
	private let cellImageView = UIImageView()
	private let cellLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		cellImageView.translatesAutoresizingMaskIntoConstraints = false
		cellLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(cellImageView)
		addSubview(cellLabel)
		
		NSLayoutConstraint.activate([
			cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			cellImageView.heightAnchor.constraint(equalToConstant: 100),
			cellImageView.widthAnchor.constraint(equalToConstant: 100),
			cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20),
			cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
		])
	}
	
	func configure(imageURL: String?, text: String) {
		if let imageURL = imageURL {
			cellImageView.sd_setImage(with: URL(string: imageURL))
		}
		cellLabel.text = text
	}
}
