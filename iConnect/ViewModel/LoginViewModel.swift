//
//  LoginViewModel.swift
//  iConnect
//
//  Created by Chris Min on 13/03/2024.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            email: email,
            password: password
        )
    }
    
}
