//
//  WeatherApp.swift
//  Weather
//
//  Created by 최지우 on 9/15/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct WeatherApp: App {
    // 최상단에서 static let 변수로 store 생성
    static let store = Store(initialState: MainTemperatureFeature.State()) {
        MainTemperatureFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: WeatherApp.store)
        }
    }
}
