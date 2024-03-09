//
//  AuthenticationTextFieldModifier.swift
//  iConnect
//
//  Created by Chris Min on 08/03/2024.
//

import SwiftUI

struct AuthenticationTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.subheadline)
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
    
}
