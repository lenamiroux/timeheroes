//
//  ChoosesViewController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class ChoosesViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var chooses : [Choose] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()

		getChooses()
    }

	//				"mean_delay_time": 13.8, tempo ganho para vc
	//				"mean_person": 75781.25, numero pessoas
	//				"time_saved": 207.0, global time minutes
	//				"time_suggested": "23:00:00", hora de partida sugerida

	func getChooses() {
		for count in 0...5 {
			let choose = Choose()
			choose.meanDelayTime = 3 + count
			choose.meanPerson = 7575 + count*2
			choose.timeSaved = Float(207 + count*5)
			
			let now = Date()
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "HH:mm"
			dateFormatter.locale = Locale(identifier: "pt_BR")
			
			let hourComponent = dateFormatter.string(from: now).components(separatedBy: ":")

			let hourString = hourComponent[0]
			let minutesString = hourComponent[1]

			var hour = Int(hourString)
			let minutes = Int(minutesString)!
			
			var nextMinutes = minutes + count*5
			if nextMinutes > 59 {
				hour = hour! + 1
				nextMinutes = 0
			}
			
			choose.timeSuggested = "\(hour!):\(nextMinutes)"
			
			chooses.append(choose)

		}
		
	}
	
}

extension ChoosesViewController : UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
