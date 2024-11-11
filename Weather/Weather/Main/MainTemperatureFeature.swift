//
//  MainTemperatureFeature.swift
//  Weather
//
//  Created by 최지우 on 11/11/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct MainTemperatureFeature {

    @ObservableState
    struct State {
        // FIXME: 초기값을 지정하는 것이 맞나?
        var currentTemperature: Int = 0
        var temperatureMax: Int = 0
        var temperatureMin: Int = 0
        var isLoading = false
    }
    
    enum Action {
        case fetchCurrentTemperature
        case currentTemperatureResponse(HourlyWeatherResponse)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchCurrentTemperature:
                state.isLoading = true
                
                return .run { send in
                    var request = setRequestData()
                    
                    do {
                        let (data, _) = try await URLSession.shared
                            .data(for: request)
                        let weatherResponse = try JSONDecoder().decode(HourlyWeatherResponse.self, from: data)
                        await send(.currentTemperatureResponse(weatherResponse))
                    } catch {
                        print("Json decoding 실패 or 네트워크 오류: \(error)")
                    }
               
                }
            case let .currentTemperatureResponse(weatherResponse):
                state.isLoading = false
                
                if let currentWeather = weatherResponse.data.timelines.first?.intervals.first {
                    state.currentTemperature = Int(currentWeather.values.temperature)
                    state.temperatureMax = Int(currentWeather.values.temperatureMax)
                    state.temperatureMin = Int(currentWeather.values.temperatureMin)
                }
                return .none
                
                
            }
            
        }
    }
    
    
}

extension MainTemperatureFeature {
    func setRequestData() -> URLRequest {
        let urlString =
            "https://api.tomorrow.io/v4/timelines?apikey=S0miM4A5Wc8cZAzw6roqiFkvJT7rwwKk"
        guard let url = URL(string: urlString) else {
            return URLRequest(url: URL(string: "about:blank")!)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")

        let requestData: [String: Any] = [
            "location": "42.3478, -71.0466",
            "fields": [
                "temperature", "temperatureMax", "temperatureMin",
                "precipitationProbability",
            ],
            "units": "metric",
            "timesteps": ["1h"],
            "startTime": "now",
            "endTime": "nowPlus20h",
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(
                withJSONObject: requestData, options: [])
        } catch {
            print("Error serializing JSON: \(error)")
        }
        
        return request
    }
}
