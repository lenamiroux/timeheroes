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
	
	var coordinates : [CLLocationCoordinate2D] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		mapView.delegate = self
		let coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
		
		mapView.setCenter(coordinate, zoomLevel: 12, animated: false)
		
		addAnnotation(withCoordinate: coordinate, title: "Custom Title", subtitle: "Custon subtitle", reuseIdentifier: "filtros")
	}

}

extension MapViewController {
	func addAnnotation(withCoordinate: CLLocationCoordinate2D?, title: String?, subtitle: String?, reuseIdentifier: String?) {
		
		guard let coordinate = withCoordinate else {
			return
		}
		coordinates.append(coordinate)

		let anottation = Annotation(coordinate: coordinate, title: title, subtitle: subtitle)
		
		if let identifier = reuseIdentifier {
			anottation.image = UIImage(named: identifier)
			anottation.reuseIdentifier = identifier
		}		
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
	
	func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
		
		guard let identifier = (annotation as? Annotation)?.reuseIdentifier, let image = UIImage(named: identifier) else {
			return nil
		}
		
		return MGLAnnotationImage(image: image, reuseIdentifier: identifier)
	}
}
