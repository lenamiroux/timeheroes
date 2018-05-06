//
//  ChoosesService.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Alamofire

class ChoosesService: NSObject {

	static func getChooses(completion: @escaping (_ choose:Choose?, _ error: CustomError?)-> Void ) {
		
		let now = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		dateFormatter.locale = Locale(identifier: "pt_BR")
		
		let hourComponent = dateFormatter.string(from: now).components(separatedBy: ":")
		
		let hourString = hourComponent[0]
		let minutesString = hourComponent[1]
		
		guard let hour = Int(hourString), let minutes = Int(minutesString) else {
			let error = CustomError(titleError: "Ops!", messageError: "Não foi possível recuperar seus dados.")
			completion(nil, error)
			return
		}
		
		let url = "http://18.191.32.54:8080/locations/\(hour)/\(minutes)"
		
		
		
		Alamofire.request(url).responseJSON { (dataResponse) in
			guard let values = dataResponse.result.value as? [String:Any] else {
				let error = CustomError(titleError: "Ops!", messageError: "Falhar ao tentar recuperar dados do servidor.")
				completion(nil,error)
				return
			}
			
			let choose = Choose()
			choose.meanDelayTime = values["mean_delay_time"] as? Double
			choose.meanPerson = values["mean_person"] as? Float
			choose.timeSaved = values["time_saved"] as? Float
			choose.timeSuggested = values["time_suggested"] as? String

			completion(choose, nil)
			
		}
		
	}
	
}
