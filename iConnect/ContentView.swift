//
//  ContentView.swift
//  iConnect
//
//  Created by Chris Min on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            // FEED VIEW
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            
            
            // EXPLORE VIEW
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    selectedTab = 1
                }
                .tag(1)
            
            
            // UPLOAD VIEW
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    selectedTab = 2
                }
                .tag(2)
            
            
            // NOTIFICATION VIEW
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 3
                }
                .tag(3)
            
            
            // PROFILE VIEW
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 4
                }
                .tag(4)
        
        }
        
    }
}

#Preview {
    ContentView()
}
