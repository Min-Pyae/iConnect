//
//  PostView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                // PROFILE IMAGE
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack {
                        
                        // USER NAME
                        Text("chrismin")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        // TIME
                        Text("10 m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        // BUTTON
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                        
                    }
                    
                    // POST TEXT
                    Text("Hello! I am an iOS Engineer.")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .padding(.vertical, 8)
                    .foregroundStyle(.cyan)
                    
                }
                
            }
            .padding()
            
        }
        
    }
}

#Preview {
    PostView()
}
