//
//  CircularImageView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI
import Kingfisher


// PROFILE IMAGE SIZE ENUMERTION
enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
            
    }
}


struct CircularImageView: View {
    
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user?.profileImageUrl {
            
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
            
        } else {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
            
        }
    }
}

#Preview {
    CircularImageView(user: DeveloperPreview.shared.user, size: .medium)
}
