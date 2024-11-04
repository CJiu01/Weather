//
//  HourlyWeatherModel.swift
//  Weather
//
//  Created by 최지우 on 11/4/24.
//

import Foundation

struct HourlyWeatherModel {
    let time: String
    let icon: String
    let temperature: Int
}

extension HourlyWeatherModel {
    // 샘플 데이터
    static func sampleDate() -> [HourlyWeatherModel] {
        return [
            HourlyWeatherModel(time: "Now", icon: "cloud.moon.fill", temperature: 21),
            HourlyWeatherModel(time: "10PM", icon: "cloud.drizzle.fill", temperature: 21),
            HourlyWeatherModel(time: "11PM", icon: "cloud.heavyrain.fill", temperature: 19),
            HourlyWeatherModel(time: "12AM", icon: "cloud.bolt.fill", temperature: 19),
            HourlyWeatherModel(time: "1AM", icon: "cloud.sun.rain.fill", temperature: 19)
        ]
    }

}
