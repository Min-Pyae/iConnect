//
//  CircularImageView.swift
//  iConnect
//
//  Created by Chris Min on 09/03/2024.
//

import SwiftUI

struct CircularImageView: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .foregroundStyle(.black)
    }
}

#Preview {
    CircularImageView()
}
