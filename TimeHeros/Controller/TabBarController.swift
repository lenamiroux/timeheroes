//
//  TabBarController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tabBar.items![0].selectedImage = #imageLiteral(resourceName: "selected_inicio")
//		self.tabBarController?.tabBar.items?[0].selectedImage =
		self.tabBar.items![1].image = #imageLiteral(resourceName: "default_meus_destinos")
		self.tabBar.items![2].image = #imageLiteral(resourceName: "default_recompensas")
	}
	
}
