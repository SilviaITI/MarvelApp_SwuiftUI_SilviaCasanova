//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI
struct RootView: View {
    @StateObject var rootViewModel = RootViewModel()
     
    var body: some View {
       ZStack {
            switch rootViewModel.status{
            case .splash:
                SplashView(isRotating: .constant(true))
            case .home:
                CharactersView()
                    .transition(.move(edge: .trailing))
            }
        }
        .onAppear(perform: rootViewModel.changeState)
        .animation(.default, value: rootViewModel.status)
    }
    
}

#Preview {
    RootView()
}
