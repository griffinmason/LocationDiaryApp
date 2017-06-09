//
//  GeoPoint.swift
//  ix-day6
//
//  Created by George Mason on 6/6/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import Foundation
import Gloss

class GeoPoint: Decodable, Glossy {
    
    var lat: Double
    var lng: Double
    
    init() {
        self.lat = 0.0
        self.lng = 0.0
    }
    
    init(latitude lat: Double, longitude lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
    required init?(json: JSON) {
        self.lat = ("lat" <~~ json)!
        self.lng = ("lng" <~~ json)!
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "lat" ~~> self.lat,
            "lng" ~~> self.lng
            ])
    }
    
}
