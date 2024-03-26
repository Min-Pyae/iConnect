//
//  ProfileView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // USER BIO AND STATS
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
            
                    // FOLLOW BUTTON
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 352, height: 32)
                            .foregroundStyle(.cyan)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.cyan, lineWidth: 1)
                            }
                        
                    }
                    
                    
                    // USER CONTENT LIST VIEW
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
                
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
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
    CurrentUserProfileView()
}
