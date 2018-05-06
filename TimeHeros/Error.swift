//
//  Error.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit

class CustomError: NSObject {

	var titleError: String?
	var messageError: String?
	
	init(titleError: String?, messageError: String?) {
		self.titleError = titleError
		self.messageError = messageError
	}
	
	init(withError: NSError?) {
		guard let error = withError else{
			return
		}
		
		self.messageError = error.localizedFailureReason
	}
	
}
