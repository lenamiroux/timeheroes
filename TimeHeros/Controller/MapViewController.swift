//
//  MapViewController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController {

	@IBOutlet weak var mapView: MGLMapView!

	override func viewDidLoad() {
		super.viewDidLoad()
		mapView.delegate = self
		let coordinates: (latitude: Double?, longitude: Double?) = (latitude: 40.7326808, longitude: -73.9843407)
		
		mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407), zoomLevel: 12, animated: false)
		
		addAnnotation(with: coordinates)
	}

}

extension MapViewController {
	func addAnnotation(with coordinates: (latitude: Double?, longitude: Double?)) {
		
		guard let latitude = coordinates.latitude, let longitude = coordinates.longitude else {
			return
		}
		
		let anottation = Annotation()
		anottation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		anottation.title = "Hello world!"
		anottation.subtitle = "Welcome to my marker"
		
		mapView.addAnnotation(anottation)
	}
}

extension MapViewController: MGLMapViewDelegate {
	// Use the default marker. See also: our view annotation or custom marker examples.
	func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
		print(#function)
		return nil
	}
	
	// Allow callout view to appear when an annotation is tapped.
	func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
		print(#function)
		return true
	}
}
