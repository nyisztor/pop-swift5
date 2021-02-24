//
//  OpenWeatherMapController.swift
//  WeatherApp
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import Foundation

//!!! Get your own API key at http://openweathermap.org
// You'll need to sign up first, but the process is straightforward - see https://openweathermap.org/guide#how.
// After registration, it takes a couple of hours until the API key gets activated.
private enum API {
    static let key = "f93596170efbdda49dfe5f361287f6fa"
}


final class OpenWeatherMapController: WebServiceController {
    func fetchWeatherData(for city: String,
                          completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
        let endpoint = "http://api.openweathermap.org/data/2.5/find?q=\(city)&units=imperial&appid=\(API.key)"
        // create a string that can be used in URLs
        
        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let endpointURL = URL(string: safeURLString) else {
            completionHandler(nil, WebServiceControllerError.invalidURL(endpoint))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: endpointURL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                completionHandler(nil, WebServiceControllerError.forwarded(error!))
                return
            }
            guard let responseData = data else {
                completionHandler(nil, WebServiceControllerError.invalidPayload(endpointURL))
                return
            }
            
            // ...to be continued
        })
    }
}
