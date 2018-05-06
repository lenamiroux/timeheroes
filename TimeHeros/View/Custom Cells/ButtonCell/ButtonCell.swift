//
//  ButtonCell.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

protocol ButtonCellDelegate: class {
	func didTapButton()
}

class ButtonCell: UITableViewCell {

	@IBOutlet weak var button: UIButton!
	
	static let reuseIdentifier = "ButtonCell"
	static let cellHeight = CGFloat(80)
	
	var delegate: ButtonCellDelegate?
	
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		button.layer.cornerRadius = 8
    }
	
	@IBAction func didTapButton(_ sender: UIButton) {
		delegate?.didTapButton()
	}
}
