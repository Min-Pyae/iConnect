//
//  ContentActionButtonsView.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import SwiftUI

struct ContentActionButtons: View {
    
    @ObservedObject var viewModel: ContentActionButtonsViewModel
    
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
            
            if post.likes > 0 {
                Text("\(post.likes) likes")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 4)
            }
            
        }
        
    }
}

#Preview {
    ContentActionButtons(post: DeveloperPreview.shared.post)
}
