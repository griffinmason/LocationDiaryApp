//
//  FirstViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var map: MKMapView!
    var localManager: CLLocationManager!
    var currentUserLocation: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.string(forKey: "mapType") == nil {
            UserDefaults.standard.set("regular", forKey: "mapType")
        }
        
        localManager = CLLocationManager()
        localManager.delegate = self
        localManager.desiredAccuracy = kCLLocationAccuracyBest
        localManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            localManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get the users location from the array of locations
        let userLocation: CLLocation = locations[0] as CLLocation
        
        // You can call stopUpdatingLocation() to stop listening for location updates
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        // Store reference to the users location in the class instance (self)
        currentUserLocation = userLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        // An error occurred trying to retrieve users location
        print("Error \(error)")
    }

}

