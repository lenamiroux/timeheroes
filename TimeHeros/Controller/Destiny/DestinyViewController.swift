//
//  DestinyViewController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class DestinyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "Destino"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.tintColor = UIColor(red: 144.0 / 255.0, green: 19.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)

    }
	
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
