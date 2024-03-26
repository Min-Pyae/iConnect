//
//  FirestoreConstants.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import Foundation
import Firebase


struct FirestoreConstants {
    
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    static let PostCollection = Root.collection("posts")
    static let FollowerCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    static let RepliesCollection = Root.collection("replies")
    static let ActivitiesCollection = Root.collection("activities")
    
}
