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
    
    
    @MainActor
    func fetchCurrentUser() async throws {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        self.currentUsers = user
        
    }
    
    
    func resetCurrentUser() {
        self.currentUsers = nil
    }
}
