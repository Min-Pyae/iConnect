//
//  EditProfileView.swift
//  iConnect
//
//  Created by Chris Min on 25/03/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText = ""
    @State private var linkText = ""
    @State private var isPrivateProfile = false
    
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
                            
                            Text("Chris Min")
                        }
                        
                        Spacer()
                        
                        CircularImageView()
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
                        Text("Linnk")
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
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.cyan)
                    })
                }
                
                // DONE BUTTON
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .foregroundStyle(.cyan)
                    })
                }
            }
            
        }
    }
}

#Preview {
    EditProfileView()
}
