//
//  ChooseCell.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class ChooseCell: UITableViewCell {

	@IBOutlet weak var pedestrianChooseImageView: UIImageView!
	@IBOutlet weak var waitLabel: UILabel!
	@IBOutlet weak var wonTimeLabel: UILabel!
	@IBOutlet weak var savedGlobalTimeLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		
//		let gradient = CAGradientLayer()
//		gradient.frame = bounds
//		gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
//		view.layer.insertSublayer(gradient, at: 0)
		
    }
	
	func setupChoose(withPhrase phrase: String?, with image: UIImage?, andChoose:Choose?) {

		guard let choose = andChoose else {
			return
		}
		
		pedestrianChooseImageView.image = image
		waitLabel.text = phrase
//		wonTimeLabel.text = String(choose.timeSaved)
//		savedGlobalTimeLabel.text =
	}
    
}
