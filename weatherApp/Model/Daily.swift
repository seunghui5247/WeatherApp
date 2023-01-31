//
//  Daily.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import Foundation

struct Daily: Decodable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}
