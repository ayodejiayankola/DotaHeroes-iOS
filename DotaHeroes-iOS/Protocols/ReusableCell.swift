//
//  ReusableCell.swift
//  DotaHeroes-iOS
//
//  Created by Ayodeji Ayankola on 04/05/2023.
//

import Foundation

protocol ReusableCell {
		static var reuseIdentifier: String { get }
}

extension ReusableCell {
		static var reuseIdentifier: String {
				return String(describing: self)
		}
}
