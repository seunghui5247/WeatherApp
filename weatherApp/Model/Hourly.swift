//
//  Hourly.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import Foundation

struct Hourly: Decodable {
    let dt: Int
    let temp: Double
    let weather: [Weather]
}
