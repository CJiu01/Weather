//
//  HourlyForecastView.swift
//  Weather
//
//  Created by 최지우 on 9/30/24.
//

import SwiftUI

struct HourlyForecastView: View {
    
    let weatherData: [HourlyWeatherModel]
    
    var body: some View {
        VStack(alignment: .leading)  {
            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                .foregroundStyle(.white)
                .font(Font.system(size: 18, weight: .regular))
                .shadow(radius: 2.0)

            Divider()
                .background(.white)
                .padding(.vertical, 8)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(weatherData, id: \.time) { data in
                        VStack {
                            Text(data.time)
                                .foregroundStyle(.white)
                                .font(Font.system(size: 17, weight: .medium))
                            Image(systemName: data.icon)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.vertical, 24)
                            Text("\(data.temperature)°")
                                .foregroundStyle(.white)
                                .font(Font.system(size: 22, weight: .medium))
                        }
                    }.padding(.trailing, 20)
                }
            }
        }
        .padding(11)
        .background {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
        }
        .cornerRadius(15)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

#Preview {
    HourlyForecastView(weatherData: HourlyWeatherModel.sampleDate())
}
