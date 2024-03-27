//
//  PostReplyCellView.swift
//  iConnect
//
//  Created by Chris Min on 27/03/2024.
//

import SwiftUI

struct PostReplyCellView: View {
    
    let reply: PostReply
    
    private var user: User? {
        return reply.user
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                // PROFILE IMAGE
                CircularImageView(user: user, size: .small)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack {
                        
                        // USER NAME
                        Text(user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        // TIME
                        Text(reply.timestamp.timestampToString())
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
                    Text(reply.replyText)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    
                }
                .padding(.horizontal, 4)
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Divider()
                .padding(.horizontal)
            
        }
    }
}

#Preview {
    PostReplyCellView(reply: DeveloperPreview.shared.reply)
}
