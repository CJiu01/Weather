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
        UITabBar.appearance().backgroundColor = UIColor(red: 0.23, green: 0.33, blue: 0.52, alpha: 0.3)
    }
    
    var body: some View {
        TabView {
            LeftView()
                .tabItem {
                    Image(systemName: "map")
                        .imageScale(.small)
                }
            MainView()
                .tabItem {
                    Image(systemName: "location.fill")
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
        
        ZStack(alignment: .top) {
            LinearGradient(colors: [Color(red: 0.23, green: 0.33, blue: 0.52),
                                    Color(red: 0.70, green: 0.53, blue: 0.58)],
                                           startPoint: .top,
                                           endPoint: .bottom)
            .ignoresSafeArea()
            
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
