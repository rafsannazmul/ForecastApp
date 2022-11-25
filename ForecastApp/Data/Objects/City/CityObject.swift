//
//  CityObject.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/22/22.
//

import Foundation

class CityObject: Codable{
    var name: String
    var country: String
    var coord: CoordCity
}

class CoordCity: Codable {
    var lat: Double
    var lon: Double
}
