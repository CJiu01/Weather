//
//  SummaryView.swift
//  Weather
//
//  Created by 최지우 on 10/7/24.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {

        VStack {
            VStack(spacing: 5) {
                Text("Seongnam-si")
                    .font(Font.system(size: 32))
                    .foregroundColor(.white)
                
                Text("21°")
                    .font(Font.system(size: 100))
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                
                Text("Partly Cloudy")
                    .foregroundColor(.white)
                
                Text("H:29° L:15°")
                    .foregroundColor(.white)
                
                
            }.padding(.top, 10)
        }
        
    }
}
