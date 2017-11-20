//
//  ViewController.swift
//  FollowMe
//
//  Created by Praveen Pendyala on 11/19/17.
//  Copyright © 2017 Praveen Pendyala. All rights reserved.
//

import UIKit
import MapboxDirections
import MapboxNavigation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let origin = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.9131752, longitude: -77.0324047), name: "Mapbox")
        let destination = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), name: "White House")
        
        let options = RouteOptions(waypoints: [origin, destination])
        options.routeShapeResolution = .full
        options.includesSteps = true
        
        Directions.shared.calculate(options) { (waypoints, routes, error) in
            guard let route = routes?.first else { return }
            
            let viewController = NavigationViewController(for: route)
            self.present(viewController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

