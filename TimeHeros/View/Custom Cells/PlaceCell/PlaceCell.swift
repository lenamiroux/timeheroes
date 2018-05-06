//
//  PlaceCell.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {

	@IBOutlet weak var pointLabel: UILabel!
	@IBOutlet weak var lineView: UIView!
	@IBOutlet weak var addressTextView: UITextView!
	
	static let reuseIdentifier = "PlaceCell"
	static let cellHeight = CGFloat(160)
	
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
    }

    
}
