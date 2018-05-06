//
//  DateCell.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {

	@IBOutlet weak var dateLabel: UILabel!
	
	static let reuseIdentifier = "DateCell"
	static let cellHeight = CGFloat(48)
	
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
    }

    
}
