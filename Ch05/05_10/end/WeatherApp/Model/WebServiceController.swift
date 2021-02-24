//
//  WebServiceController.swift
//  WeatherApp
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import Foundation

public protocol WebServiceController {
    init(fallbackService: WebServiceController?)
    
    var fallbackService: WebServiceController? { get }
    
    func fetchWeatherData(for city: String,
                          completionHandler: @escaping(String?, WebServiceControllerError?) -> Void)
}

// MARK: - WebServiceControllerError
public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}
