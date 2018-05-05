//
//  Annotation.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Mapbox

class Annotation: MGLPointAnnotation {

	override init() {
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
