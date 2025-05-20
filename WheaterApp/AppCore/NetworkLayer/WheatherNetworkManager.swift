//
//  WheatherNetworkManager.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import Foundation

final class WheaterNetworkManager {
    // MARK: - Private propertie
    private let apiKey = "d6efbbff56e34f2292752926251705"
    private let testCity = "London"

    // MARK: - Private method for url
    private func getUrl(_ cityName: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/forecast.json"

        let queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "days", value: "5"),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "alerts", value: "no")
        ]

        components.queryItems = queryItems

        guard let url = components.url else {
            return nil
        }
        return url
    }

    // MARK: - Public method for fetch weather info
    func testMethod(city: String, compelition: @escaping (WeatherResponse?) -> Void) async  {
        guard let url = getUrl(city) else {
            print("[WheaterNetworkManager] Error 0 with url")
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print(url)

            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode else {
                throw URLError(.badServerResponse)
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            compelition(result)
        } catch let error {
            print("[WheaterNetworkManager] Error 1 with fetching data - \(error.localizedDescription)")
        }
    }
}
