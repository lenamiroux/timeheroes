//
//  PlaceCell.swift
//  TimeHeros
//
//  Created by Victor de Lima on 06/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Mapbox

class PlaceCell: UITableViewCell {

	@IBOutlet weak var pointLabel: UILabel!
	@IBOutlet weak var lineView: UIView!
	@IBOutlet weak var addressTextView: UITextView!
	
	@IBOutlet weak var mapView: MGLMapView!

	static let reuseIdentifier = "PlaceCell"
	static let cellHeight = CGFloat(200)
	
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
    }

	func setupMap(withCoordinates: CLLocationCoordinate2D?){
		
		mapView.delegate = self
		mapView.isUserInteractionEnabled = false
		addAnnotation(withCoordinate: withCoordinates, title: nil, subtitle: nil, reuseIdentifier: "map_annotation")
		
		centerMap(inCoordinates: withCoordinates, withZoomLevel: 10)
		
	}
	
	private func centerMap(inCoordinates: CLLocationCoordinate2D?, withZoomLevel zoomLevel: Double){
		
		if let coordinates = inCoordinates {
			mapView.setCenter(coordinates, zoomLevel: zoomLevel, animated: false)
		}
		
	}
	
	private func addAnnotation(withCoordinate: CLLocationCoordinate2D?, title: String?, subtitle: String?, reuseIdentifier: String?) {
		
		guard let coordinate = withCoordinate else {
			return
		}
		
		let anottation = Annotation(coordinate: coordinate, title: title, subtitle: subtitle)
		
		if let identifier = reuseIdentifier {
			anottation.image = UIImage(named: identifier)
			anottation.reuseIdentifier = identifier
		}
		mapView.addAnnotation(anottation)
	}
	
}

extension PlaceCell: MGLMapViewDelegate {
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
