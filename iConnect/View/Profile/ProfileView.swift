//
//  ProfileView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    @State var selectedProfileTab: ProfileTab = .posts
    @Namespace var animation
    private var profileTabWidth: CGFloat {
        let count = CGFloat(ProfileTab.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // USER BIO AND STATS
                VStack(spacing: 20) {
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            // FULLNAME AND USERNAME
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
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
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .frame(width: 352, height: 32)
                            .foregroundStyle(.white)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    }
                    
                    
                    // USER CONTENT LIST VIEW
                    VStack {
                        HStack {
                            ForEach(ProfileTab.allCases) { tab in
                                
                                VStack {
                                    Text(tab.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedProfileTab == tab ? .semibold : .regular)
                                    
                                    if selectedProfileTab == tab {
                                        Rectangle()
                                            .foregroundStyle(.cyan)
                                            .frame(width: profileTabWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: 180, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedProfileTab = tab
                                    }
                                }
                                
                            }
                        }
                        
                        LazyVStack {
                            ForEach(0 ... 10, id: \.self) { post in
                                PostView()
                            }
                        }
                        
                    }
                    .padding(.vertical, 10)
                    
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
