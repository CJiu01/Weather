//
//  HourlyWeatherResponse.swift
//  Weather
//
//  Created by 최지우 on 11/4/24.
//

import SwiftUI

struct HourlyWeatherResponse: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [Timeline]
}

struct Timeline: Codable {
    let timestep: String
    let endTime: String
    let startTime: String
    let intervals: [Interval]
}

struct Interval: Codable {
    let startTime: String
    let values: WeatherValues
}

struct WeatherValues: Codable {
    let precipitationProbability: Double
    let temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double
}
