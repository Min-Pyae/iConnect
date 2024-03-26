//
//  Post.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Post: Identifiable, Codable {
    
    @DocumentID var postID: String?
    
    var  id: String {
        return postID ?? UUID().uuidString
    }
    
    let userId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var didLike: Bool? = false
    var user: User?
}
