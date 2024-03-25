//
//  UserCellView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            
            // PRPFILE IMAGE
            CircularImageView()
            
            
            // USER NAME
            VStack(alignment: .leading) {
                
                Text("johnwick")
                    .fontWeight(.semibold)
                
                Text("John Wick")
                
            }
            .font(.footnote)
            
            
            Spacer()
            
            
            // FOLLOW BUTTON
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color(.cyan),
                            lineWidth: 1
                        )
                }
                .foregroundStyle(.cyan)
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    UserCell()
}
