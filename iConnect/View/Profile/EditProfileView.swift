//
//  EditProfileView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    let user: User
    @State private var bioText = ""
    @State private var linkText = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack {
                    
                    // NAME AND PROFILE IMAGE
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularImageView(user: user, size: .medium)
                            }
                        }
                    }
                    
                    
                    Divider()
                    
                    
                    // BIO
                    VStack(alignment: .leading) {
                        Text("Name")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bioText, axis: .vertical)
                    }
                    
                    
                    Divider()
                    
                    
                    // LINK
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link", text: $linkText, axis: .vertical)
                    }
                    
                    
                    Divider()
                    
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.cyan, lineWidth: 1)
                }
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // CANCEL BUTTON
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
                }
                
                // DONE BUTTON
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
                }
            }
            
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
