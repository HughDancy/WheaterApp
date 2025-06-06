//
//  LocationManager.swift
//  WheaterApp
//
//  Created by Борис Киселев on 04.06.2025.
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func getCityName(city: String?)
}

final class LocationManager: NSObject {
    // MARK: - Private properties
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    weak var delegate: LocationManagerDelegate?

    // MARK: - Init
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }

    // MARK: - Check authorization method
    func checkAuthorization(_ compelition: () -> Void) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            compelition()
        }
    }

    // MARK: - Get city name private method
    private func getCurrentCityName(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [unowned self] placemarks, error in
            if let _ = error {
                self.delegate?.getCityName(city: nil)
                return
            }

            guard let placemark = placemarks?.last else {
                self.delegate?.getCityName(city: nil)
                return
            }
            locationManager.stopUpdatingLocation()

            if let city = placemark.locality {
                self.delegate?.getCityName(city: city)
                print("THIS IS CITY - \(city)")
            } else if let administrativeArea = placemark.administrativeArea {
                self.delegate?.getCityName(city: administrativeArea)
                print("THIS IS CITY - \(administrativeArea)")
            } else {
                self.delegate?.getCityName(city: nil)
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse ||
            manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let location = locations.last else { return }
        self.getCurrentCityName(location: location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("WENT SOME ERROR WITH LOCATION MANAGER")
    }
}
