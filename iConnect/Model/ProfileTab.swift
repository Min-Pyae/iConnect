//
//  ProfileTab.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation

enum ProfileTab: Int, CaseIterable, Identifiable {
    case posts
    case replies
    
    var title: String {
        switch self {
        case .posts:
            return "Posts"
        case .replies:
            return "Replies"        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
