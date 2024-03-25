//
//  FeedView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(1 ..< 10, id: \.self) { post in
                        PostView()
                    }
                    
                }
                .refreshable {
                    print("Do your refresh work here")
                }
                .navigationTitle("iConnect")
                .navigationBarTitleDisplayMode(.inline)
                
            }
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
