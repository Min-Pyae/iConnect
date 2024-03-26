//
//  FeedViewModel.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation


@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchPosts()
        try await fetchPostsUserData()
    }
    
    private func fetchPostsUserData() async throws {
        for index in 0 ..< posts.count  {
            let post = posts[index]
            let userId = post.userId
            let user = try await UserService.fetchUser(withUid: userId)
            posts[index].user = user
        }
    }
    
}
