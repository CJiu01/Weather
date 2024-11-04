//
//  SummaryView.swift
//  Weather
//
//  Created by 최지우 on 10/7/24.
//

import SwiftUI

struct SummaryView: View {
    
    @State private var temperature: String = "21°"
    @State private var temperatureMax: Int = 0
    @State private var temperatureMin: Int = 0
    
    var body: some View {

        VStack {
            VStack(spacing: 5) {
                Text("Seongnam-si")
                    .font(Font.system(size: 32))
                    .foregroundColor(.white)
                
                Text(temperature)
                    .font(Font.system(size: 100))
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                
                Text("Partly Cloudy")
                    .foregroundColor(.white)
                
                Text("H:\(temperatureMax)° L:\(temperatureMin)°")
                    .foregroundColor(.white)
                
                
                
            }.padding(.top, 10)
        }
        .onAppear {
            fetchWeatherData()
        }
    }
}

#Preview {
    SummaryView()
        .background(Color.black)
}

extension SummaryView {
    func fetchWeatherData() {
        // URL 및 요청 설정
        let urlString = "https://api.tomorrow.io/v4/timelines?apikey=S0miM4A5Wc8cZAzw6roqiFkvJT7rwwKk"
        guard let url = URL(string: urlString) else { return }
        
        // POST 요청을 위한 URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        
        // 요청 데이터
        let requestData: [String: Any] = [
            "location": "42.3478, -71.0466",
            "fields": ["temperature", "temperatureMax", "temperatureMin", "precipitationProbability"],
            "units": "metric",
            "timesteps": ["1h"],
            "startTime": "now",
            "endTime": "nowPlus20h"
        ]
        
        // JSON 데이터로 변환
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData, options: [])
        } catch {
            print("Error serializing JSON: \(error)")
            return
        }
        
        // 데이터 태스크 생성 및 실행
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 오류 처리
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // 데이터 확인 및 응답 처리
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                // JSON 응답 파싱
                let weatherResponse = try JSONDecoder().decode(HourlyWeatherResponse.self, from: data)
                print("Weather data: \(weatherResponse)")
                
                DispatchQueue.main.async {
                    if let firstInterval = weatherResponse.data.timelines.first?.intervals.first {
                        self.temperature = "\(Int(firstInterval.values.temperature))°"
                        self.temperatureMax =  Int(firstInterval.values.temperatureMax)
                        self.temperatureMin =  Int(firstInterval.values.temperatureMin)
                    }
                }
                
                
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}
