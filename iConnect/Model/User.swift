//
//  User.swift
//  iConnect
//
//  Created by Chris Min on 14/03/2024.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let email: String
    let fullname: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
