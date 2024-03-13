//
//  RegistrationViewModel.swift
//  iConnect
//
//  Created by Chris Min on 10/03/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var username: String = ""
    
    @MainActor
    func register() async throws {
        try await AuthService.shared.register(
            email: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
    
}
