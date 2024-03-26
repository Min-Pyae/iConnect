//
//  UploadPostViewModel.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation
import Firebase


class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post =  Post(userId: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await PostService.uploadPost(post)
    }
    
}
