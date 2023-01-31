//
//  NetworkViewController.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit
import Alamofire
import CoreLocation

extension MainViewController: CLLocationManagerDelegate {
    func fetchData() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate
        
        guard let latitude = coor?.latitude, let longitude = coor?.longitude else {
            return
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geocoder.reverseGeocodeLocation(location, preferredLocale: locale, completionHandler: {(placemarks, error) in
            if let address: [CLPlacemark] = placemarks {
                if let location: String = address.last?.locality {
                    self.locationLabel.text = location
                    print(location)
                }
            }
        })
        
        let url = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric&lang=kr&exclude=minutely,alerts"
        AF.request(url)
            .responseDecodable(of: WeatherType.self) { response in
                switch response.result {
                case .success(let data):
                    self.setCurrentData(data: data)
                case .failure(let fail):
                    print(fail.localizedDescription)
                }
        }
    }
}
