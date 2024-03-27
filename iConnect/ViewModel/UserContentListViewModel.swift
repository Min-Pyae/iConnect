//
//  UserContentListViewModel.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import Foundation


@MainActor
class UserContentListViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var replies = [PostReply]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
        
        Task {
            try await fetchUserReplies()
        }
    }
    
    
    func fetchUserPosts() async throws {
        var posts = try await PostService.fetchUserPosts(uId: user.id)
        
        for index in 0 ..< posts.count {
            posts[index].user = self.user
        }
        
        self.posts = posts
    }
    
    
    func fetchUserReplies () async throws {
        
        self.replies = try await PostService.fetchPostsReplies(forUser: user)
        
        try await fetchReplyPostData()
    }
    
    
    func fetchReplyPostData() async throws {
        
        for index in 0 ..< replies.count {
            
            let reply = replies[index]
            var post = try await PostService.fetchPost(postId: reply.postId)
            post.user = try await UserService.fetchUser(withUid: post.userId)
            replies[index].post = post
        }
        
    }
    
}
