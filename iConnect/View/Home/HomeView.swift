//
//  HomeView.swift
//  iConnect
//
//  Created by Chris Min on 13/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab = 0
    @State private var showUploadView = false
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            // FEED VIEW
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            
            
            // EXPLORE VIEW
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    selectedTab = 1
                }
                .tag(1)
            
            
            // UPLOAD VIEW
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    selectedTab = 2
                }
                .tag(2)
            
            
            // NOTIFICATION VIEW
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 3
                }
                .tag(3)
            
            
            // PROFILE VIEW
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 4
                }
                .tag(4)
            
        }
//        .onChange(of: selectedTab, { oldValue, newValue in
//            showUploadView = selectedTab == 2
//        })
        .onChange(of: selectedTab, perform: { value in
            showUploadView = selectedTab == 2
        })
        .sheet(
            isPresented: $showUploadView,
            onDismiss: {
                selectedTab = 0
            },
            content: {
                UploadPostView()
            }
        )
        .tint(.cyan)
        
        
    }
}

#Preview {
    HomeView()
}
