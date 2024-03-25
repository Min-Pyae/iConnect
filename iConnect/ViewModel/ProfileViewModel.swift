//
//  ProfileViewModel.swift
//  iConnect
//
//  Created by Chris Min on 14/03/2024.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    
    private func setUpSubscribers() {
        UserService.shared.$currentUsers.sink { [weak self] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
}
