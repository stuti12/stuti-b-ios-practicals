//
//  LocationModel.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 07/03/22.
//

import UIKit

class LocationModel: NSObject {
    var title: String
        var placelattitude: Double?
        var placelongitude: Double?

        init(_ name: String){
        title = name
        }

        init(_ name: String,_ lattitude: Double,_ longitude: Double){
            title = name
            placelattitude = lattitude
            placelongitude = longitude
        }
    static func getLocationsWithCoordinates() -> [LocationModel] {

            return [ LocationModel("New Delhi", 28.632780332334686, 77.19415505318165),
                     LocationModel("Ahmedabad", 23.08368496286138, 72.58057333076279),
                     LocationModel("Goa", 15.47434396393431, 74.00783974265859),
                     LocationModel("Kerala", 9.385745129350662, 76.89323163370585),
                     LocationModel("Shimla", 31.194735457417313, 77.23420689469604)]

        }

        static func getLocations() -> [LocationModel]{

            return [ LocationModel("New Delhi"),
                     LocationModel("Ahmedabad"),
                     LocationModel("Goa"),
                     LocationModel("Kerala"),
                     LocationModel("Shimla")]

        }
        
}
