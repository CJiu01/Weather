//
//  DailyForecaseView.swift
//  Weather
//
//  Created by 최지우 on 10/7/24.
//

import SwiftUI

struct DailyForecaseView: View {
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
            
            ForEach(0..<9) { _ in
                HStack {
                    Text("Today")
                        .foregroundStyle(.white)
                        .font(Font.system(size: 22, weight: .medium))
                    
                    Spacer()
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundStyle(.yellow)
                    
                    Spacer()
                        .frame(maxWidth: 15)
                    Text("15°")
                        .foregroundStyle(.white.opacity(0.6))
                        .font(Font.system(size: 22, weight: .medium))

                    ProgressView(value: 0.3, total: 1)
                        
                    Text("29°")
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
    DailyForecaseView()
        .background(.blue)
}
