//
//  CustomTabView.swift
//  Weather
//
//  Created by 최지우 on 10/28/24.
//

import SwiftUI



struct CustomTabView: View {
    
    @Binding var selectedTab: TabItems
    
    var body: some View {
        HStack {
            
            
            Button {
                // action
                selectedTab = .map
                
            } label: {
                
                Image(systemName: "map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                    .foregroundStyle(Color.white)

            }
            
            
            Spacer()
            
            Button {
                // action
                selectedTab = .currentLocation
                
            }   label: {
                
                Image(systemName: "location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13, height: 13)
                    .foregroundStyle(Color.white)

            }
            .padding(4)
            
            
            Button {
                selectedTab = .circleLocation
            } label: {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color.white)

            }
            
            
            Spacer()

            
            Button {
                // action
                selectedTab = .list
                
            }   label: {
                
                Image(systemName: "list.bullet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                    .foregroundStyle(Color.white)
            }
    
            
        }
        .padding(10)

    }
    
}
                            
#Preview {
    CustomTabView(selectedTab: .constant(.currentLocation))
        .background(Color.black)
}
