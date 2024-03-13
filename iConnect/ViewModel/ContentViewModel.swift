//
//  ContentViewModel.swift
//  iConnect
//
//  Created by Chris Min on 13/03/2024.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscriber()
    }
    
    
    private func setUpSubscriber() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
