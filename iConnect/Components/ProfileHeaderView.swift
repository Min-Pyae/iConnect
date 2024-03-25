//
//  ProfileHeaderView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                
                // FULLNAME AND USERNAME
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                    
                }
                
                // BIO
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                
                Text("100 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            }
            
            Spacer()
            
            CircularImageView()
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
