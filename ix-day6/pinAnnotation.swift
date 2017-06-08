//
//  pinAnnotation.swift
//  ix-day6
//
//  Created by George Mason on 6/8/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        
    }
}
