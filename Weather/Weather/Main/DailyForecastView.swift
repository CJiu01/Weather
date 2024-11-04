//
//  DailyForecastView.swift
//  Weather
//
//  Created by 최지우 on 10/7/24.
//

import SwiftUI

struct DailyForecastView: View {
    
    let weatherData: [DailyWeatherModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.white)
                Text("10-DAY FORECAST")
                    .foregroundStyle(.white)
                    .font(Font.system(size: 15, weight: .medium))

                
            }
            Divider()
            
            ForEach(weatherData, id: \.day) { data in
                HStack {
                    Text(data.day)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 22, weight: .medium))
                    
                    Spacer()
                    
                    Image(systemName: data.icon)
                        .foregroundStyle(.yellow)
                    
                    Spacer()
                        .frame(maxWidth: 15)
                    Text("\(data.lowTemperature)°")
                        .foregroundStyle(.white.opacity(0.6))
                        .font(Font.system(size: 22, weight: .medium))

                    ProgressView(value: 0.3, total: 1)
                        
                    Text("\(data.highTemperature)°")
                        .foregroundStyle(.white)
                        .font(Font.system(size: 22, weight: .medium))
                    
                }
                
                
                
                Divider()
            }
        }
        .padding(15)
        .background {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
        }
        .cornerRadius(15)

    }
}

#Preview {
    DailyForecastView(weatherData: DailyWeatherModel.mock())
        .background(.black)
}
