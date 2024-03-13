//
//  LoginView.swift
//  iConnect
//
//  Created by Chris Min on 08/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Spacer()
                
                // LOGO IMAGE
                Image("iConnect-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                // TEXT FIELDS
                VStack(spacing: 20) {
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(AuthenticationTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(AuthenticationTextFieldModifier())
                    
                }
                
                
                // FORGOT PASSWORD
                NavigationLink(value: "accessibility") {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.cyan)
                }
                
                
                // SIGN IN BUTTON
                AuthenticationButton(
                    buttonTitle: "Sign In",
                    buttonAction: {
                        Task {
                            try await viewModel.login()
                        }
                    }
                )
                
                Spacer()
                
                Divider()
                
                // SIGN UP REGISTRATION
                NavigationLink(value: "signup") {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
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
                
                RegistrationView()
                
            })
            
        }
        
    }
}

#Preview {
    LoginView()
}
