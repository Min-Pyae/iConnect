//
//  ImageUploadService.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import Foundation
import Firebase
import FirebaseStorage


class ImageUploadService {
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let storageReference = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        do {
            let _ = try await storageReference.putDataAsync(imageData)
            let url = try await storageReference.downloadURL()
            return url.absoluteString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
