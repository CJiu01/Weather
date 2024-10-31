//
//  ContentView.swift
//  Weather
//
//  Created by 최지우 on 9/15/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor(red: 0.23, green: 0.33, blue: 0.52, alpha: 1)
    }
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "location.fill")
                }
            
            LeftView()
                .tabItem {
                    Image(systemName: "map")
                        .imageScale(.small)
                }
            
            
            RightView()
                .tabItem {
                    Image(systemName: "list.bullet")
                        .background(.white)
                }
        }.accentColor(.white)
    }
}

struct MainView: View {
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                                
                VStack {
                    SummaryView()
                        .padding(.top, 78)
                    
                    HourlyForecastView()
                        .padding(.top, 43)
                    
                    DailyForecaseView()
                    
                }.padding(.horizontal, 20)
            }
        }
        .background {
            LinearGradient(colors: [Color(red: 0.23, green: 0.33, blue: 0.52),
                                    Color(red: 0.70, green: 0.53, blue: 0.58)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()

        }
        
    }
        
}


struct LeftView: View {
    var body: some View {
        VStack {
            Text("Left View")
        }
    }
}

struct RightView: View {
    var body: some View {
        VStack {
            Text("Right View")
        }
    }
}


#Preview {
    ContentView()
}
