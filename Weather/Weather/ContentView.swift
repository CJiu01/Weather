//
//  ContentView.swift
//  Weather
//
//  Created by 최지우 on 9/15/24.
//

import SwiftUI

struct ContentView: View {

    @State var selectedTab: TabItems = .currentLocation

    var body: some View {
        
            TabView(selection: $selectedTab) {
                MapView()
                    .tag(TabItems.map)

                CurrentLocationView()
                    .tag(TabItems.currentLocation)

                ListView()
                    .tag(TabItems.list)

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
            .overlay(alignment: .bottom) {
                CustomTabView(selectedTab: $selectedTab)
                    .background(Color(red: 0.70, green: 0.53, blue: 0.58))
                    
            }

        
            .background {
                LinearGradient(
                    colors: [
                        Color(red: 0.23, green: 0.33, blue: 0.52),
                        Color(red: 0.70, green: 0.53, blue: 0.58),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

            }

    }
}

#Preview {
    ContentView()
}
