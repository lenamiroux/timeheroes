//
//  GeocoderService.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import MapboxGeocoder

class GeocoderService: NSObject {
	
	static let geocoder = Geocoder.shared
	
	class func search(byString address:String, completion: @escaping (_ placeName: String?, _ coordinates: CLLocationCoordinate2D?, _ error: CustomError?)->Void) {
		let options = ForwardGeocodeOptions(query: address)
		
		// To refine the search, you can set various properties on the options object.
		options.allowedISOCountryCodes = ["BR"]
		options.allowedScopes = [.address, .pointOfInterest]
		
		let task = geocoder.geocode(options) { (placemarks, attribution, error) in
			guard let placemark = placemarks?.first else {
				let customError = CustomError(withError: error)
				completion(nil, nil,customError)
				return
			}
			
			print(placemark.name)
			// 200 Queen St
			print(placemark.qualifiedName)
			// 200 Queen St, Saint John, New Brunswick E2L 2X1, Canada

			let coordinate = placemark.location?.coordinate
			print("\(coordinate?.latitude), \(coordinate?.longitude)")
//			// 45.270093, -66.050985
			
			completion(placemark.qualifiedName, coordinate, nil)
		}
		
		task.resume()
		
	}
}

//extension Geocoder {
//
//	class func getVariable(variable: String) -> String {
//		if let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
//			let values = NSDictionary(contentsOf: url) as? [String : Any] {
//
//			if let accessToken = values["MGLMapboxAccessToken"] as? String {
//				return accessToken
//			}
//		}
//		return ""
//	}
//
//}
