//
//  ProfileView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // USER BIO AND STATS
                VStack(spacing: 20) {
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            // FULL NAME AND USERNAME
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text("Chris Min")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("chris_min")
                                    .font(.subheadline)
                                
                            }
                    
                            
                            Text("An iOS Engineer")
                                .font(.footnote)
                            
                            Text("100 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                        }
                        
                        Spacer()
                        
                        CircularImageView()
                        
                    }
                    .padding(.horizontal)
                    
            
                    // FOLLOW BUTTON
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
                            .frame(width: 352, height: 32)
                            .foregroundStyle(.white)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    })
                    
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

#Preview {
    ProfileView()
}
