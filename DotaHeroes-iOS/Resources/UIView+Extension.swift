//
//  UIView+Extension.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 03/05/2023.
//

import UIKit

extension UIView {
	func fillSuperview() {
		guard let superview = superview else {
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			topAnchor.constraint(equalTo: superview.topAnchor),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor)
		])
	}
}
