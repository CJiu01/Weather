//
//  CurrentLocationView.swift
//  Weather
//
//  Created by 최지우 on 11/4/24.
//

import SwiftUI

struct CurrentLocationView: View {
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                VStack {
                    SummaryView()
                        .padding(.top, 78)
                    
                    HourlyForecastView(weatherData: HourlyWeatherModel.sampleDate())
                        .padding(.top, 43)
                    
                    DailyForecaseView()
                    
                }.padding(.horizontal, 20)
            }
        }
        
    }
}

#Preview {
    CurrentLocationView()
}
