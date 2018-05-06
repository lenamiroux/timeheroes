//
//  MapViewController.swift
//  TimeHeros
//
//  Created by Victor de Lima on 05/05/2018.
//  Copyright © 2018 Victor Cotrim. All rights reserved.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class MapViewController: UIViewController {

//	@IBOutlet weak var mapView: MGLMapView!
	@IBOutlet weak var placeholderMapView: UIView!
	
	@IBOutlet weak var destinyTextField: UITextField!
	var navigationMap: NavigationMapView!
	var directionsRoute: Route?
	
	var coordinates : [CLLocationCoordinate2D] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		setupMap()
		setupTextField()
	}

	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 44))
		addButton.backgroundColor = .black
		addButton.setTitleColor(.white, for: .normal)
		addButton.addTarget(self, action: #selector(actionAddRouteToCoordinate), for: .touchUpInside)
		
		view.addSubview(addButton)
		
		
//		GeocoderService.search(byString: "Taguatinga Shopping") { (placeName, coordinates, error) in
//
//			print(error)
//		}
		
		
	}
	
}

extension MapViewController {
	
	func setupMap() {
		navigationMap = NavigationMapView(frame: view.bounds)
		placeholderMapView.addSubview(navigationMap)

		navigationMap.showsUserLocation = true
		navigationMap.setUserTrackingMode(.follow, animated: true)
		navigationMap.delegate = self

	}
	
	func centerMap(inCoordinates: CLLocationCoordinate2D?, withZoomLevel zoomLevel: Double){

		if let coordinates = inCoordinates {
			navigationMap.setCenter(coordinates, zoomLevel: zoomLevel, animated: true)
		}

	}
	
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
		navigationMap.addAnnotation(anottation)
	}

	// Method from mapbox starter guide
	func calculateRoute(from: CLLocationCoordinate2D?,
						to: CLLocationCoordinate2D?,
						completion: @escaping (Route?, CustomError?) -> ()) {
		
		
		guard let originCoordinate = from, let destinationCoordinate = to else {
			let error = CustomError(titleError: "Ops!", messageError: "Pontos de origem e destino não encontrados.")
			completion(nil,error)
			return
		}
		
		// Coordinate accuracy is the maximum distance away from the waypoint that the route may still be considered viable, measured in meters. Negative values indicate that a indefinite number of meters away from the route and still be considered viable.
		let origin = Waypoint(coordinate: originCoordinate, coordinateAccuracy: -1, name: "Start")
		let destination = Waypoint(coordinate: destinationCoordinate, coordinateAccuracy: -1, name: "Finish")
		
		// Specify that the route is intended for automobiles avoiding traffic
		let options = NavigationRouteOptions(waypoints: [origin, destination], profileIdentifier: .automobileAvoidingTraffic)
		
		// Generate the route object and draw it on the map
		_ = Directions.shared.calculate(options) { [unowned self] (waypoints, routes, errorMap) in
			self.directionsRoute = routes?.first
			
			// Draw the route on the map after creating it
			if let directions = self.directionsRoute {
				self.drawRoute(route: directions)
			} else {
				let error = CustomError(withError: errorMap)
				
				completion(nil,error)
			}
			
		}
	}

	// Method from mapbox starter guide
	func drawRoute(route: Route) {
		guard route.coordinateCount > 0 else { return }
		// Convert the route’s coordinates into a polyline
		var routeCoordinates = route.coordinates!
		let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: route.coordinateCount)
		
		// If there's already a route line on the map, reset its shape to the new route
		if let source = navigationMap.style?.source(withIdentifier: "route-source") as? MGLShapeSource {
			source.shape = polyline
		} else {
			let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
			
			// Customize the route line color and width
			let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
			lineStyle.lineColor = MGLStyleValue(rawValue: #colorLiteral(red: 0.1897518039, green: 0.3010634184, blue: 0.7994888425, alpha: 1))
			lineStyle.lineWidth = MGLStyleValue(rawValue: 3)
			
			// Add the source and style layer of the route line to the map
			navigationMap.style?.addSource(source)
			navigationMap.style?.addLayer(lineStyle)
		}
	}
}

extension MapViewController {
	func setupTextField() {
		
		let attributedString = NSMutableAttributedString(string: "qual o seu destino?", attributes: [
			.font: UIFont(name: "Exo-Medium", size: 18.0)!,
			.foregroundColor: UIColor(white: 74.0 / 255.0, alpha: 1.0),
			.kern: -0.15
			])
		attributedString.addAttributes([
			.font: UIFont(name: "Exo-Black", size: 18.0)!,
			.foregroundColor: UIColor(red: 144.0 / 255.0, green: 19.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
			], range: NSRange(location: 11, length: 7))
		attributedString.addAttribute(.font, value: UIFont(name: "Exo-Bold", size: 18.0)!, range: NSRange(location: 18, length: 1))
		
		destinyTextField.attributedPlaceholder = attributedString

	}
}

extension MapViewController {
	@objc func actionAddRouteToCoordinate() {
		print(#function)
		let destination = CLLocationCoordinate2D(latitude: 39.7326808, longitude: -74.9843407)
		addAnnotation(withCoordinate: destination, title: "End point", subtitle: "Here we end the route", reuseIdentifier: "filtros")
		
		let startPoint = navigationMap.userLocation?.coordinate
		calculateRoute(from: startPoint, to: destination) { (route, errorRoute) in
			if let _ = errorRoute {
				// show error Dialog
			}
		}

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
