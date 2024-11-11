//
//  CurrentLocationView.swift
//  Weather
//
//  Created by 최지우 on 11/4/24.
//

import ComposableArchitecture
import SwiftUI

struct CurrentLocationView: View {
    let store: StoreOf<MainTemperatureFeature>
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                VStack {
                    SummaryView(store: store)
                        .padding(.top, 78)
                    
                    HourlyForecastView(weatherData: HourlyWeatherModel.sampleDate())
                        .padding(.top, 43)
                    
                    DailyForecastView(weatherData: DailyWeatherModel.mock())
                    
                }.padding(.horizontal, 20)
            }
        }
        
    }
}

#Preview {
    CurrentLocationView(
        store: Store(initialState: MainTemperatureFeature.State()) {
            MainTemperatureFeature()
        }
    )
    .background(Color.black)
}

