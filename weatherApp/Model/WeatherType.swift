//
//  WeatherType.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import Foundation

struct WeatherType: Decodable {
    let timezone: String
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}
