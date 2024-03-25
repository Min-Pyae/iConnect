//
//  PostService.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct PostService {
    
    // FUNCTION FOR UPLOADING POST
    @MainActor
    static func uploadPost(_ post: Post) async throws {
        guard let postData = try? Firestore.Encoder().encode(post) else { return }
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
    
}
