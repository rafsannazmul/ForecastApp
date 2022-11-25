//
//  WeatherModel.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/22/22.
//

import Foundation

class WeatherModel {
    
    private var lang = Locale.current.languageCode
    var lat: Double?
    var lon: Double?
    var currentWeather: CurrentWeather?
    var dailyWeather: DailyWeather?
    var allWeather: [CurrentWeather]?
    
    private let group = DispatchGroup()
    
    func withGeolocationWeather(completion: @escaping () -> ()) {
        
        group.enter()
            LocationWeatherManager.shared.getAllWeather(lat: lat!, lon: lon!, locale: lang!) { [weak self] result in
                switch result {
                case .success(let weather):
                    print("ALL WEATHER")
                    dump(weather)
                case .failure(let error):
                    print("ALL error")
                    print(error.localizedDescription)
                }
                self?.group.leave()
            }
        
        group.enter()
            LocationWeatherManager.shared.getCurrentWeather(lat: lat!, lon: lon!, locale: lang!) { [weak self] result in
                switch result {
                case .success(let weather):
                    self?.currentWeather = weather
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.group.leave()
            }
        
        group.enter()
            LocationWeatherManager.shared.getDailyWeather(lat: lat!, lon: lon!, locale: lang!) { [weak self] result in
                switch result {
                case .success(let weather):
                    self?.dailyWeather = weather
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.group.leave()
            }
        
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func noGeolocationWeather(completion: @escaping () -> ()) {
        group.enter()
            NoLocationWeatherManager.shared.getCurrentWeather(lang: lang!) { [weak self] result in
                switch result {
                case .success(let weather):
                    self?.currentWeather = weather
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.group.leave()
            }
        
        group.enter()
            NoLocationWeatherManager.shared.getDailyWeather(lang: lang!) { [weak self] result in
                switch result {
                case .success(let weather):
                    self?.dailyWeather = weather
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.group.leave()
            }
            
        
        group.notify(queue: .main) {
            completion()
        }
    }
    
}

