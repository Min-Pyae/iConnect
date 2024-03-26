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
    static func uploadPost(_ post: Post) async throws {
        guard let postData = try? Firestore.Encoder().encode(post) else { return }
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
    
    // FUNCTION FOR UPLOADING POST
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await Firestore
            .firestore()
            .collection("posts")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Post.self) })
    }
    
    
    static func fetchUserPosts(uId: String) async throws -> [Post] {
        let snapshot = try await Firestore
            .firestore()
            .collection("posts")
            .whereField("userId", isEqualTo: uId)
            .getDocuments()
        
        let posts = snapshot.documents.compactMap({ try? $0.data(as: Post.self) })
        return posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
}


// MARK: - LIKES
extension PostService {
    
    // FUNCTION FOR LIKING POST
    static func likePost(_ post: Post) async throws {
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let postReference = FirestoreConstants.PostCollection.document(post.id)
        
        async let _ =  try await postReference.collection("post-likes").document(uId).setData([:])
        async let _ = try await postReference.updateData(["likes": post.likes + 1])
        async let _ = try await FirestoreConstants.UserCollection.document(uId).collection("user-likes").document(post.id).setData([:])
        
    }
    
    
    // FUNCTION FOR UNLIKING POST
    static func unlikePost(_ post: Post) async throws {
        
        guard post.likes > 0 else { return }
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let postReference = FirestoreConstants.PostCollection.document(post.id)
        
        async let _ =  try await postReference.collection("post-likes").document(uId).delete()
        async let _ = try await FirestoreConstants.UserCollection.document(uId).collection("user-likes").document(post.id).delete()
        async let _ = try await postReference.updateData(["likes": post.likes - 1])
    }
    
    
    // FUNCTION FOR CHECKING IF USER LIKED A POST
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uId = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirestoreConstants.UserCollection
            .document(uId)
            .collection("user-likes")
            .document(post.id)
            .getDocument()
        
        return snapshot.exists
    }
    
    
}
