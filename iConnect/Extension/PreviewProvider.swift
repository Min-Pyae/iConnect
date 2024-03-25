//
//  PreviewProvider.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI


extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, email: "john@gmail", fullname: "John Wick", username: "john-wick")
}
