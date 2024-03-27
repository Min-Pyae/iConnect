//
//  PostDetailsView.swift
//  iConnect
//
//  Created by Chris Min on 27/03/2024.
//

import SwiftUI

struct PostDetailsView: View {
    
    let post: Post
    
    @StateObject var viewModel: PostDetailsViewModel
    
    init(post: Post) {
        self.post = post
        self._viewModel = StateObject(wrappedValue: PostDetailsViewModel(post: post))
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                HStack {
                    
                    CircularImageView(user: post.user, size: .small)
                    
                    Text(post.user?.fullname ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(post.timestamp.timestampToString())
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    })
                    
                }
                
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text(post.caption)
                        .font(.subheadline)
                    
                    ContentActionButtons(post: post)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            Divider()
                .padding(.vertical)
            
            LazyVStack {
                ForEach(viewModel.replies) { reply in
                    PostReplyCellView(reply: reply)
                }
            }
            
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PostDetailsView(post: DeveloperPreview.shared.post)
}
