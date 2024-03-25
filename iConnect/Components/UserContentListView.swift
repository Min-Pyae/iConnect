//
//  UserContentListView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI

struct UserContentListView: View {
    
    @State var selectedProfileTab: ProfileTab = .posts
    
    @Namespace var animation
    
    private var profileTabWidth: CGFloat {
        let count = CGFloat(ProfileTab.allCases.count)
        return UIScreen.main.bounds.width / count - 16
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
                ForEach(0 ... 10, id: \.self) { post in
                    PostView()
                }
            }
            
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    UserContentListView()
}