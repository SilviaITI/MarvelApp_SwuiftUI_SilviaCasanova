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
    


#Preview {
    RootView()
}
