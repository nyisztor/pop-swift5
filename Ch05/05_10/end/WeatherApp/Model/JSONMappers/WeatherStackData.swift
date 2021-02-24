//
//  WeatherStackData.swift
//  WeatherApp2
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import Foundation

struct WeatherStackContainer: Codable {
    var current: WeatherStackCurrent?
}

struct WeatherStackCurrent: Codable {
    let temperature: Int?
    let weather_descriptions: [String]?
}

struct WeatherStackCondition: Codable {
    var text: String
    var icon: String // icon image url
}
