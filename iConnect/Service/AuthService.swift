//
//  AuthService.swift
//  iConnect
//
//  Created by Chris Min on 10/03/2024.
//

import Firebase
import FirebaseFirestoreSwift


class AuthService {
    
    @Published var userSession: Firebase.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser 
    }
    
    
    // FUNCTION FOR LOGGING IN
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            
            print("DEBUG: Failed to log in with \(error.localizedDescription)")
            
        }
    }
    
    // FUNCTION FOR USER REGISTRATION
    @MainActor
    func register(email: String, password: String, fullname: String, username: String) async throws {
        
        do {
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, email: email, fullname: fullname, username: username)
            
        } catch {
            
            print("DEBUG: Failed to register with \(error.localizedDescription)")
            
        }
        
    }
    
    
    // FUNCTION FOR SIGNING OUT
    func signOut() {
        
        try? Auth.auth().signOut()
        
        // Remove User Session
        self.userSession = nil
        
        // RESET CURRENT USER
        UserService.shared.resetCurrentUser()
    }
    
    
    // FUNCTION FOR UPLOADING USER DATA TO FIRESTORE
    @MainActor
    private func uploadUserData(id: String, email: String, fullname: String, username: String) async throws {
        let user = User(id: id, email: email, fullname: fullname, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
