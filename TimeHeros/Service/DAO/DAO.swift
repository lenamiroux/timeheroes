//
//  DAO.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Alamofire

class DAO: NSObject {

	static var Manager: Alamofire.SessionManager {
		// Create custom manager
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
		configuration.timeoutIntervalForRequest = 40
		
		let man = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
		
		return man
	}
	
}
