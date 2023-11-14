//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI
enum RootState {
    case splash
    case home
}

struct RootView: View {
    @StateObject var viewModel = SplashViewModel()
    @State var viewState: RootState = .splash
     
    var body: some View {
        switch viewState {
        case .splash:
           EmptyView()
        case .home:
            CharactersView()
                .transition(.slide)
        }
    }
    
}

#Preview {
    RootView()
}
