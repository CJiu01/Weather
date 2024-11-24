//
//  SummaryView.swift
//  Weather
//
//  Created by 최지우 on 10/7/24.
//

import ComposableArchitecture
import SwiftUI

struct SummaryView: View {
    let store: StoreOf<MainTemperatureFeature>

//    @State private var temperature: Int = 0
//    @State private var temperatureMax: Int = 0
//    @State private var temperatureMin: Int = 0

    var body: some View {

        VStack {
            
            if store.isLoading {
                ProgressView()
            } else {
                VStack(spacing: 5) {
                    Text("Seongnam-si")
                        .font(Font.system(size: 32))
                        .foregroundColor(.white)

                    Text("\(store.currentTemperature)")
                        .font(Font.system(size: 100))
                        .fontWeight(.thin)
                        .foregroundColor(.white)

                    Text("Partly Cloudy")
                        .foregroundColor(.white)

                    Text("H:\(store.temperatureMax)° L:\(store.temperatureMin)°")
                        .foregroundColor(.white)

                }.padding(.top, 10)
            }
            
        }
        .onAppear {
            store.send(.fetchCurrentTemperature)
        }
    }
}

#Preview {
    SummaryView(
        store: Store(initialState: MainTemperatureFeature.State()) {
            MainTemperatureFeature()
        }
    )
    .background(Color.black)
}



//extension SummaryView {
//    func fetchWeatherData() {
//
//        let urlString =
//            "https://api.tomorrow.io/v4/timelines?apikey=S0miM4A5Wc8cZAzw6roqiFkvJT7rwwKk"
//        guard let url = URL(string: urlString) else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
//
//        let requestData: [String: Any] = [
//            "location": "42.3478, -71.0466",
//            "fields": [
//                "temperature", "temperatureMax", "temperatureMin",
//                "precipitationProbability",
//            ],
//            "units": "metric",
//            "timesteps": ["1h"],
//            "startTime": "now",
//            "endTime": "nowPlus20h",
//        ]
//
//        do {
//            request.httpBody = try JSONSerialization.data(
//                withJSONObject: requestData, options: [])
//        } catch {
//            print("Error serializing JSON: \(error)")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//
//            do {
//                let weatherResponse = try JSONDecoder().decode(
//                    HourlyWeatherResponse.self, from: data)
//                print("Weather data: \(weatherResponse)")
//
//                // UI 업데이트 메인 스레드에서 진행.
//                DispatchQueue.main.async {
//                    if let firstInterval = weatherResponse.data.timelines.first?
//                        .intervals.first
//                    {
//                        self.temperature =
//                            Int(firstInterval.values.temperature)
//                        self.temperatureMax =
//                            Int(firstInterval.values.temperatureMax)
//                        self.temperatureMin =
//                            Int(firstInterval.values.temperatureMin)
//                    }
//                }
//
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
//        task.resume()
//    }
//}
