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
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
		case 0:
			return DateCell.cellHeight
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.row {
		case 0:
			return generateDateCell()
		default:
			return UITableViewCell()
		}
	}
	
	
}

extension DestinyViewController {
	
	func registerCell() {
		tableView.register(UINib(nibName: "DateCell", bundle: Bundle.main), forCellReuseIdentifier: DateCell.reuseIdentifier)
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
}
