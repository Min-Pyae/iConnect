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
                    
                    ForEach(1 ..< 10) { post in
                        PostView()
                    }
                    
                }
                .navigationTitle("iConnect")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .scrollIndicators(.hidden)
            
        }
        
    }
}

#Preview {
    FeedView()
}
