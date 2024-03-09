//
//  RegistrationView.swift
//  iConnect
//
//  Created by Chris Min on 08/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var username: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        
        VStack(spacing: 20) {
            
            Spacer()
            
            // LOGO IMAGE
            Image("iConnect-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            // TEXT FIELDS
            VStack(spacing: 20) {
                
                TextField("Enter your email", text: $email)
                    .modifier(AuthenticationTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(AuthenticationTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(AuthenticationTextFieldModifier())
                
                TextField("Enter your user name", text: $username)
                    .modifier(AuthenticationTextFieldModifier())
                
            }
            
            
            // SIGN UP BUTTON
            AuthenticationButton(
                buttonTitle: "Sign Up",
                buttonAction: {
                    
                }
            )
            
            Spacer()
            
            Divider()
            
            // SIGN UP REGISTRATION
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.footnote)
                .foregroundStyle(.cyan)
            }
            .padding(.vertical)
            
        }
        .tint(.cyan)
        .padding(.horizontal)
        .navigationDestination(for: String.self, destination: { string in
            
            
            
        })
        
    }
    
    
}

#Preview {
    RegistrationView()
}
