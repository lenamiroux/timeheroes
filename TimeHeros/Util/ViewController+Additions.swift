//
//  ViewController+Additions.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

extension UIView {
	
	func applyGradient(withStartColor startColor:UIColor, andEndColor endColor: UIColor) {
		
		let gradient = CAGradientLayer()
		gradient.frame = self.bounds
		gradient.colors = [startColor.cgColor, endColor.cgColor]
		
		self.layer.insertSublayer(gradient, at: 0)
	}
	
}
