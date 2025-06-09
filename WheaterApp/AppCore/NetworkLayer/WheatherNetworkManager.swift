//
//  WheatherNetworkManager.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import Foundation
import UIKit.UIImage

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
    func fetchWeatherInfo(city: String) async -> WeatherResponse?  {
        guard let newCity = UserDefaults.standard.string(forKey: "CityName"),
              let url = getUrl(newCity) else {
            print("[WheaterNetworkManager] Error 0 with url")
            return nil
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
            return result
        } catch let error {
            print("[WheaterNetworkManager] Error 1 with fetching data - \(error.localizedDescription)")
            return nil
        }
    }
    
     func downloadImage(simpleURL: String? ) async -> UIImage?  {
        if let simpleURL = simpleURL {
            guard let url = URL(string: simpleURL) else {
                print("[WheaterNetworkManager] 2 - problem with download image")
                return nil
               }

               // Разрешаем HTTP (если URL начинается с http://)
               let configuration = URLSessionConfiguration.default
               configuration.requestCachePolicy = .returnCacheDataElseLoad

              
               if simpleURL.starts(with: "https://") {
                   configuration.waitsForConnectivity = true
               }

               let session = URLSession(configuration: configuration)

               // Асинхронно загружаем данные
            do {
                let (data, response) = try await session.data(from: url)

                // Проверяем, что ответ сервера успешный (200-299)
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return UIImage(data: data)
            } catch let error {
                print("[WheaterNetworkManager] Error 3 - Problem with UIImage data ")
                return nil
            }
        } else {
            return nil
        }
   
           // Преобразуем Data в UIImage
          
    }
}
