//
//  Activity.swift
//  ix-day6
//
//  Created by George Mason on 6/6/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Activity {
    
    var name: String
    var description: String
    var date: String
    var image: UIImage?
    var location: GeoPoint
    
    init?() {
        self.name = ""
        self.description = ""
        self.date = ""
        self.image = nil
        self.location = GeoPoint(latitude: 0.0, longitude: 0.0)
    }
}
