//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import Foundation

/*
 Adopt ObservableObject protocol for data binding
 SwiftUI observes properties marked with @Published in conforming types automatically
 */
class WeatherViewModel: ObservableObject {
    @Published var weatherInfo = ""
    
    private let weatherService = OpenWeatherMapController()
        
    func fetch(city: String) {
        weatherService.fetchWeatherData(for: city, completionHandler: { (info, error) in
            guard error == nil,
                let weatherInfo = info else {
                    DispatchQueue.main.async {
                        self.weatherInfo = "Could not retrieve weather information for \(city)"
                    }
                return
            }
            DispatchQueue.main.async {
                self.weatherInfo = weatherInfo
            }
        })
    }
}
