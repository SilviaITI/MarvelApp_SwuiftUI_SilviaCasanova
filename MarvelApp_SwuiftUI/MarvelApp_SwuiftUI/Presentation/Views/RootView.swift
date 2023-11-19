//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI


 var isWatchOS: Bool {
#if os(watchOS)
    return true
#else
    return false
#endif
}

struct RootView: View {
    
    // MARK: - Properties
    @StateObject var rootViewModel = RootViewModel()

    // MARK: - Principal View
    var body: some View {
        NavigationStack {
            ZStack  {
                switch rootViewModel.status{
                case .splash:
                    SplashView()
                case .home:
                    CharactersView()
                }
            }
            .onAppear(perform: rootViewModel.changeState)
        }
    }
}

// MARK: - Preview
#Preview {
    RootView()
}
