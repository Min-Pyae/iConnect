//
//  UserContentListViewModel.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import Foundation


class UserContentListViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        var posts = try await PostService.fetchUserPosts(uId: user.id)
        
        for index in 0 ..< posts.count {
            posts[index].user = self.user
        }
        
        self.posts = posts
    }
}
