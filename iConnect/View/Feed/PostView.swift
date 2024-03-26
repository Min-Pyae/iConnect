//
//  PostView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                // PROFILE IMAGE
                CircularImageView(user: post.user, size: .small)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack {
                        
                        // USER NAME
                        Text(post.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        // TIME
                        Text(post.timestamp.timestampToString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        // EDIT BUTTON
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                        
                    }
                    
                    // POST TEXTS
                    Text(post.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    
                    // CONTENT ACTION BUTTONS
                    ContentActionButtons(post: post)
                        .padding(.top, 5)
                        .foregroundStyle(.cyan)
                    
                    
                    
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Divider()
                .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    PostView(post: DeveloperPreview.shared.post)
}
