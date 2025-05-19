//
//  WheatherNetworkManager.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import Foundation

final class WheaterNetworkManager {
    // MARK: - Private propertie
    private var apiKey = "d6efbbff56e34f2292752926251705"
    private let testCity = "London"
    
    
    func testMethod() {
        let testUrlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(testCity)&days=5"
        guard let url = URL(string: testUrlString) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                print("THIS IS FORECATST FOR FIVE DAYS FOR - \(result?.location.name)")
                result?.forecast.forecastDay.forEach({ day in
                    print("MAX WIND SPEED - \(day.day.maxWindSpeed), MAX WATER - \(day.day.avghumidity)")
                })
            } catch let error {
                print(error.localizedDescription)
            }
        }

    }
}
