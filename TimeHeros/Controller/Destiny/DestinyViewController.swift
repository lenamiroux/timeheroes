//
//  DestinyViewController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class DestinyViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		registerCell()
		setupNavigation()
    }
	
	func setupNavigation() {
		navigationItem.title = "Destino"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.tintColor = UIColor(red: 144.0 / 255.0, green: 19.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
	}
}

extension DestinyViewController : UITableViewDelegate, UITableViewDataSource{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
		case 0:
			return DateCell.cellHeight
		case 1, 2:
			return PlaceCell.cellHeight
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.row {
		case 0:
			return generateDateCell()
		case 1:
			return generatePlaceCell(address: "Indie Warehouse Coworking SHIN Ca2, 07, Brasília - DF", point: "A")
		case 2:
			return generatePlaceCell(address: "Av. das Araucárias Q 205, 1655 Ed. Turmalina", point: "B")
		default:
			return UITableViewCell()
		}
	}
	
	
}

extension DestinyViewController {
	
	func registerCell() {
		tableView.register(UINib(nibName: "DateCell", bundle: Bundle.main), forCellReuseIdentifier: DateCell.reuseIdentifier)
		tableView.register(UINib(nibName: "PlaceCell", bundle: Bundle.main), forCellReuseIdentifier: PlaceCell.reuseIdentifier)
	}
	
	func generateDateCell() -> DateCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: DateCell.reuseIdentifier) as! DateCell
		
		let now = Date()
		let dateFormmater = DateFormatter()
		dateFormmater.dateFormat = "EEEE, d MMMM yyyy - HH:mm"
		dateFormmater.locale = Locale(identifier: "PT_br")

		let date = dateFormmater.string(from: now)
		cell.dateLabel.text = date
		
		return cell
	}
	
	func generatePlaceCell(address: String, point: String) -> PlaceCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.reuseIdentifier) as! PlaceCell
		
		cell.pointLabel.text = point
		if point == "A" {
			cell.lineView.isHidden = false
			cell.addressTextView.text = address
			cell.addressTextView.isUserInteractionEnabled = false
		} else {
			cell.lineView.isHidden = true
			cell.addressTextView.toolbarPlaceholder = address
		}
		return cell
	}
}