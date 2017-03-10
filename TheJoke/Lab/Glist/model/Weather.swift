//
//  Weather.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/6.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import UIKit
import IGListKit

enum WeatherCondition: String {
    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case partlyCloudy = "Partly Cloudy"
    case dustStorm = "Dust Storm"
    
    var emoji: String {
        switch self {
        case .cloudy: return "☁️"
        case .sunny: return "☀️"
        case .partlyCloudy: return "⛅️"
        case .dustStorm: return "🌪"
        }
    }
}

class Weather: NSObject {
    
    let temperature: Int
    let high: Int
    let low: Int
    let date: Date
    let sunrise: String
    let sunset: String
    let condition: WeatherCondition
    
    init(
        temperature: Int,
        high: Int,
        low: Int,
        date: Date,
        sunrise: String,
        sunset: String,
        condition: WeatherCondition
        ) {
        self.temperature = temperature
        self.high = high
        self.low = low
        self.date = date
        self.sunrise = sunrise
        self.sunset = sunset
        self.condition = condition
    }
    
}
