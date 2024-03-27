//
//  PostRepliesView.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import SwiftUI

struct PostReplyView: View {
    
    let post: Post
    @State private var replyText = ""
    @State private var postViewHeight: CGFloat = 25
    
    @StateObject var viewModel = PostReplyViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    
    func setPostViewHeight() {
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        let captionSize = post.caption.heightWithConstrainedWidth(width, font: font)
        postViewHeight = captionSize + imageDimension - 16
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack(alignment: .top) {
                        
                        VStack {
                            CircularImageView(user: post.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: postViewHeight)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(post.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(post.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                        
                    }
                    
                    HStack(alignment: .top) {
                        
                        CircularImageView(user: currentUser, size: .small)
                        
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Enter your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                    }
                    
                }
                .foregroundStyle(.black)
                .padding()
                
                Spacer()
                
            }
            .onAppear {
                setPostViewHeight()
            }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // CANCEL BUTTON
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
                }
                
                // REPLY BUTTON
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task {
                            try await viewModel.uploadPostReply(replyText: replyText, post: post)
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.cyan)
                }
                
            }
            
        }
    }
}

#Preview {
    PostReplyView(post: DeveloperPreview.shared.post)
}
