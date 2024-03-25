//
//  ExploreView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        
                        NavigationLink(value: user) {
                            VStack {
                                
                                UserCell(user: user)
                                
                                Divider()
                                
                            }
                            .padding(.vertical, 4)
                        }
                        
                    }
                }
                .padding(.top, 10)
                
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            
        }
    }
}

#Preview {
    ExploreView()
}
