//
//  HomeModel.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/25/22.
//

import Foundation
import CoreLocation

class HomeModel: NSObject {
    
    var weather = WeatherModel()
    private let locationManager = CLLocationManager()
    
    func getWeather(compelition: @escaping () -> ()) {
        if weather.lat != nil && weather.lon != nil {
            print("got weather")
            weather.withGeolocationWeather {
                compelition()
            }
        } else {
            print("no weather")
            weather.noGeolocationWeather {
                compelition()
            }
     
        }
    }
    
    private func saveLocation(_ location: CLLocationCoordinate2D ) {
        weather.lat = location.latitude
        weather.lon = location.longitude
    }
    
}
extension HomeModel:  CLLocationManagerDelegate  {
    func actualLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location?.coordinate else { return }
        saveLocation(location)
        locationManager.stopUpdatingLocation()
    }
}
