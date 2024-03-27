//
//  ContentActionButtonsView.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import SwiftUI

struct ContentActionButtons: View {
    
    @ObservedObject var viewModel: ContentActionButtonsViewModel
    
    @State private var showReplySheet = false
    
    init(post: Post) {
        self.viewModel = ContentActionButtonsViewModel(post: post)
    }
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return viewModel.post.didLike ?? false
    }
    
    func ToggleLikeButton() {
        Task {
            if didLike {
                try await viewModel.unlikePost()
            } else {
                try await viewModel.likePost()
            }
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                Button(action: {
                    ToggleLikeButton()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundStyle(didLike ? .red: .cyan)
                })
                
                Button(action: {
                    showReplySheet.toggle()
                }, label: {
                    Image(systemName: "bubble.right")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.rectanglepath")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane")
                })
            }
            
            // CHECKING IF POST LIKES AND REPLIES EXIST
            HStack(spacing: 4) {
                
                if post.replies > 0 {
                    Text("\(post.replies) replies")
                }
                
                if post.replies > 0 && post.likes > 0 {
                    Text(".")
                }
                
                if post.likes > 0 {
                    Text("\(post.likes) likes")
                }
                
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.top, 4)
            
        }
        .sheet(isPresented: $showReplySheet) {
            PostReplyView(post: post)
        }
        
    }
}

#Preview {
    ContentActionButtons(post: DeveloperPreview.shared.post)
}
