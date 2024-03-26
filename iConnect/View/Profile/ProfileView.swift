//
//  ProfileView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
        
        ScrollView {
            
            // USER BIO AND STATS
            VStack(spacing: 20) {
                
                ProfileHeaderView(user: user)
                
                // FOLLOW BUTTON
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .foregroundStyle(.white)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
                
                // USER CONTENT LIST VIEW
                UserContentListView(user: user)
                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
        
        
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}

