//
//  PostDetailsViewModel.swift
//  iConnect
//
//  Created by Chris Min on 27/03/2024.
//

import Foundation


@MainActor
class PostDetailsViewModel: ObservableObject {
    
    @Published var replies = [PostReply]()
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
        
        Task {
            try await fetchPostReplies()
        }
    }
    
    private func fetchPostReplies() async throws {
        self.replies = try await PostReplyService.fetchPostReplies(forPost: post)
        try await fetchUserDataForReplies()
    }
    
    
    private func fetchUserDataForReplies() async throws {
        
        for index in 0 ..< replies.count {
            let reply = replies[index]
            async let user = try await UserService.fetchUser(withUid: reply.postReplyUserId)
            self.replies[index].user = try await user
        }
        
    }
    
}
