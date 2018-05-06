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

	func getChooses() {
		for _ in 0...4 {
			ChoosesService.getChooses { (chooseService, errorService) in
				if let _ = errorService {
					// show alert
				} else {
					if let choose = chooseService {
						self.chooses.append(choose)
					} else {
						// show alert
					}
					
				}
			}
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
