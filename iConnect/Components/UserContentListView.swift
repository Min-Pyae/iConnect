//
//  UserContentListView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI

struct UserContentListView: View {
    
    @State var selectedProfileTab: ProfileTab = .posts
    @StateObject private var viewModel: UserContentListViewModel
    @Namespace var animation
    
    private var profileTabWidth: CGFloat {
        let count = CGFloat(ProfileTab.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User) {
        self._viewModel =  StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
        
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
                
                switch selectedProfileTab {
                    
                case .posts:
                    
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                            .transition(.move(edge: .leading))
                    }
                    
                case .replies:
                    
                    ForEach(viewModel.replies) { reply in
                        ProfilePostReplies(reply: reply)
                            .transition(.move(edge: .trailing))
                    }
                    
                }
                
                
            }
            
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
