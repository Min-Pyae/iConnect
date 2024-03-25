//
//  ContentView.swift
//  iConnect
//
//  Created by Chris Min on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
