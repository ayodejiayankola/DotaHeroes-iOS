//
//  DetailView.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 27/04/2023.
//

import UIKit
import SDWebImage

class DetailView: UIView {
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = UIColor.white
		label.textAlignment = .center
		return label
	}()
	
	let attributesLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.white
		label.textAlignment = .center
		return label
	}()
	
	let rolesLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.white
		label.textAlignment = .center
		return label
	}()
	
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 50
		return imageView
	}()
	
	let legsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.white
		label.textAlignment = .center
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		nameLabel.text = "Dragon Knight"
		attributesLabel.text = "Strength - Melee"
		rolesLabel.text = "Carry, Pusher, Initiator"
		legsLabel.text = "2 legs"
		imageView.image = UIImage(named: "dragon_knight")
		if let url = URL(string: "https://cdn.dota2.com/apps/dota2/images/heroes/dragon_knight_full.png") {
			imageView.sd_setImage(with: url)
		}
		setupViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		backgroundColor = UIColor.black
		addSubview(nameLabel)
		addSubview(attributesLabel)
		addSubview(rolesLabel)
		addSubview(imageView)
		addSubview(legsLabel)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		attributesLabel.translatesAutoresizingMaskIntoConstraints = false
		rolesLabel.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		legsLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
			imageView.widthAnchor.constraint(equalToConstant: 100),
			imageView.heightAnchor.constraint(equalToConstant: 100),
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			attributesLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
			attributesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			attributesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			rolesLabel.topAnchor.constraint(equalTo: attributesLabel.bottomAnchor, constant: 8),
			rolesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			rolesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			legsLabel.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 8),
			legsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			legsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			legsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
		])
	}
}

