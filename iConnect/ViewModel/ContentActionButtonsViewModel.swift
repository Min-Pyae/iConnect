//
//  ContentActionButtonsViewModel.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import Foundation


@MainActor
class ContentActionButtonsViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        
        Task {
            try await checkIfUserLikedPost()
        }
    }
    
    // FUNCTION FOR LIKING A POST
    func likePost() async throws {
        try await PostService.likePost(post)
        self.post.didLike = true
        self.post.likes += 1
    }
    
    
    // FUNCTION FOR UNLIKING A POST
    func unlikePost() async throws {
        try await PostService.unlikePost(post)
        self.post.didLike = false
        self.post.likes -= 1
        
    }
    
    
    // FUNCTION FOR CHECKING IF USER LIKED A POST
    func checkIfUserLikedPost() async throws {
        let didLike = try await PostService.checkIfUserLikedPost(post)
        
        if didLike {
            self.post.didLike = true
        }
    }
    
}
