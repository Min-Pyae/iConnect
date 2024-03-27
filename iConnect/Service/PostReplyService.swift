//
//  PostReplyService.swift
//  iConnect
//
//  Created by Chris Min on 27/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct PostReplyService {
    
    static func uploadPostReply(_ reply: PostReply, toPost post: Post) async throws {
        guard let replyData = try? Firestore.Encoder().encode(reply) else { return }
        async let _ = try await FirestoreConstants.RepliesCollection.document().setData(replyData)
        async let _ = try await FirestoreConstants.PostCollection.document(post.id).updateData(["replies" : post.replies + 1])
    }
    
    
    static func fetchPostReplies(forPost post: Post) async throws -> [PostReply] {
        let snapshot = try await FirestoreConstants
            .RepliesCollection
            .whereField("postId", isEqualTo: post.id)
            .getDocuments()
        
        return snapshot.documents.compactMap({
            try? $0.data(as: PostReply.self)
        })
    }
    
    static func fetchPostReplies(forUser user: User) async throws -> [PostReply] {
        let snapshot = try await FirestoreConstants
            .RepliesCollection
            .whereField("postUserId", isEqualTo: user.id)
            .getDocuments()
        
        return snapshot.documents.compactMap({
            try? $0.data(as: PostReply.self)
        })
    }
    
}
