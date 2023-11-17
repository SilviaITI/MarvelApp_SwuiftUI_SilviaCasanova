//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToNextView = false
    var body: some View {
      

       ZStack {
            Image(.marvelUniverse4)
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
           Image(.escudoCapitanAmérica)
               .rotationEffect(.degrees(360.0))
        }
    }
}

#Preview {
    SplashView()
}
