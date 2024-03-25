//
//  UserService.swift
//  iConnect
//
//  Created by Chris Min on 14/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class UserService {
    @Published var currentUsers: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    
    // FUNCTION FOR FETCCHING CURRENT USER
    @MainActor
    func fetchCurrentUser() async throws {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        self.currentUsers = user
        
    }
    
    
    // FUNCTION FOR FETCHING ALL USERS
    static func fetchAllUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap ({
            try? $0.data(as: User.self)
        })
        
        return users.filter({ $0.id != currentUid})
    }
    
    
    func resetCurrentUser() {
        self.currentUsers = nil
    }
}
