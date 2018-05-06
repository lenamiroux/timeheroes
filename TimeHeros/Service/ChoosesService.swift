//
//  ChoosesService.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class ChoosesService: NSObject {

	static func getChooses(completion: @escaping ()-> Void ) {
		
		let url = ""
		
		DAO.Manager.request(url).responseJSON { (dataResponse) in
			guard let values = dataResponse as? [String:Any] else {
				return
			}

//			{
//				"mean_delay_time": 13.8, tempo ganho para vc
//				"mean_person": 75781.25, numero pessoas
//				"time_saved": 207.0, global time minutes
//				"time_suggested": "23:00:00", hora de partida sugerida
//			}
			
			
		}
		
	}
	
}
