//
//  AuthService.swift
//  iConnect
//
//  Created by Chris Min on 10/03/2024.
//

import Firebase

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
            print(result)
            
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
            print(result)
            
        } catch {
            
            print("DEBUG: Failed to register with \(error.localizedDescription)")
            
        }
        
    }
    
    
    // FUNCTION FOR SIGNING OUT
    func signOut() {
        
        try? Auth.auth().signOut()
        
        // Remove User Session
        self.userSession = nil
    }
    
}
