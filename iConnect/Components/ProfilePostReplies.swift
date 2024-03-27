//
//  ProfilePostReplies.swift
//  iConnect
//
//  Created by Chris Min on 27/03/2024.
//

import SwiftUI

struct ProfilePostReplies: View {
    
    let reply: PostReply
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // POST VIEW
            if let post = reply.post {
                
                HStack(alignment: .top) {
                    
                    VStack {
                        CircularImageView(user: post.user, size: .small)
                        
                        Rectangle()
                            .frame(width: 2, height: 64)
                            .foregroundStyle(Color(.systemGray4))
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(post.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(post.caption)
                            
                        }
                        .font(.footnote)
                        
                        ContentActionButtons(post: post)
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
            // POST REPLY VIEW
            HStack(alignment: .top) {
                CircularImageView(user: reply.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(reply.user?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text(reply.replyText)
                    
                }
                .font(.footnote)
                
            }
            
            Divider()
                .padding(.bottom, 8)
            
        }
        .padding(.horizontal)
        
    }
    
}

#Preview {
    ProfilePostReplies(reply: DeveloperPreview.shared.reply)
}
