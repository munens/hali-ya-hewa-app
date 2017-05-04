//
//  Location.swift
//  hali-ya-hewa
//
//  Created by Munene Kaumbutho on 2017-05-03.
//  Copyright © 2017 Munene Kaumbutho. All rights reserved.
//

import Foundation


// singleton class used to save our location:
class Location {
    static var sharedInstance = Location()
    
    private init() {}
    
    var Latitude: Double!
    var Longitude: Double!
}
