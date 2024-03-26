//
//  FeedView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                    }
                    
                }
            
            }
            .refreshable {
                Task {
                    try await viewModel.fetchPosts()
                }
            }
            .navigationTitle("iConnect")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.cyan)
                    })
                }
            }
            
        }
        
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
