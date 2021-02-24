//
//  WebServiceController.swift
//  WeatherApp
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import Foundation

public protocol WebServiceController {
    func fetchWeatherData(for city: String,
                          completionHandler: (String?, WebServiceControllerError?) -> Void)
}

// MARK: - WebServiceControllerError
public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}
