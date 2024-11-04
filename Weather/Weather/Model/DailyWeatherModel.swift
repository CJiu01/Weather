//
//  DailyWeatherModel.swift
//  Weather
//
//  Created by 최지우 on 11/4/24.
//

import SwiftUI

struct DailyWeatherModel {
    let day: String
    let icon: String
    let precipitationChance: Int?
    let lowTemperature: Int
    let highTemperature: Int
}

extension DailyWeatherModel {
    static func mock() -> [Self] {
        return [
            .init(
                day: "Mon", icon: "sun.max.fill", precipitationChance: 20,
                lowTemperature: 10, highTemperature: 20),
            .init(
                day: "Tue", icon: "sun.max.fill", precipitationChance: 15,
                lowTemperature: 12, highTemperature: 22),
            .init(
                day: "Wed", icon: "sun.max.fill", precipitationChance: 30,
                lowTemperature: 9, highTemperature: 18),
            .init(
                day: "Thu", icon: "sun.max.fill", precipitationChance: 5,
                lowTemperature: 8, highTemperature: 17),
            .init(
                day: "Fri", icon: "sun.max.fill", precipitationChance: 10,
                lowTemperature: 11, highTemperature: 19),
            .init(
                day: "Sat", icon: "sun.max.fill", precipitationChance: 25,
                lowTemperature: 7, highTemperature: 16),
            .init(
                day: "Sun", icon: "sun.max.fill", precipitationChance: 20,
                lowTemperature: 6, highTemperature: 15),
        ]
    }
}
