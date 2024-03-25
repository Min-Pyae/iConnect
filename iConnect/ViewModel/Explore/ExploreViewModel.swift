//
//  ExploreViewModel.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
