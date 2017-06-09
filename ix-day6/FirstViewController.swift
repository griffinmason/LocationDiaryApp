//
//  FirstViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import Gloss

class FirstViewController: UIViewController, CLLocationManagerDelegate, AddActivityDelegate {


    @IBOutlet weak var map: MKMapView!
    var localManager: CLLocationManager!
    var currentUserLocation: CLLocation!
    var location: CLLocationCoordinate2D?
    var pin: PinAnnotation?
    
    var activities: [Activity] = []
    
    
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
        
        map.showsUserLocation = true
        Alamofire.request("https://activitydiary-84452.firebaseio.com/").responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                for (key, value) in response {
                    let activity = Activity()
                    
                    if let actDictionary = value as? [String : AnyObject] {
                        activity?.name = actDictionary["name"] as! String
                        activity?.description = actDictionary["description"] as! String
                        
                        if let geoPointDictionary = actDictionary["location"] as? [String: AnyObject] {
                            let location = GeoPoint()
                            location.lat = (geoPointDictionary["lat"] as? Double)!
                            location.lng = (geoPointDictionary["lng"] as? Double)!
                            activity?.location = location
                            
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = CLLocationCoordinate2DMake((activity?.location.lat)!, (activity?.location.lng)!);
                            annotation.title = activity?.name
                            self.map.addAnnotation(annotation)
                        }
                    }
                    
                    self.activities.append(activity!)
                }
            }
        }
        setMapType()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didSaveActivity(activity: Activity) {
        let location = CLLocationCoordinate2D(latitude: currentUserLocation.coordinate.latitude, longitude: currentUserLocation.coordinate.longitude)
        let pin = PinAnnotation(title: activity.name, subtitle: activity.description, coordinate: location)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location, 100000, 100000), animated: true)
        map.addAnnotation(pin)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToAddActivity" {
            let navigationViewController = segue.destination as! UINavigationController
            let addActivityVC = navigationViewController.topViewController as! AddActivity
            
            addActivityVC.delegate = self
        }
    }
    
    func setMapType() {
        /*
         Different map types
         map.mapType = .hybrid
         map.mapType = .hybridFlyover
         map.mapType = .satellite
         map.mapType = .satelliteFlyover
         map.mapType = .standard
         */
        let mapType = UserDefaults.standard.string(forKey: "mapType")
        
        if mapType != nil {
            
            if mapType == "hybrid" {
                map.mapType = .hybrid
            }
            
            if mapType == "hybridFlyover" {
                map.mapType = .hybridFlyover
            }
            
            if mapType == "satellite" {
                map.mapType = .satellite
            }
            
            if mapType == "satelliteFlyover" {
                map.mapType = .satelliteFlyover
            }
            
            if mapType == "regular" {
                map.mapType = .standard
            }
            
        }
    }

}

