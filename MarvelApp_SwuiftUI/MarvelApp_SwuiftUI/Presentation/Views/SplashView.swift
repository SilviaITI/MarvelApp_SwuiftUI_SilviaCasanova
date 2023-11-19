//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Principal View
    var body: some View {
        ZStack {
            Image("Marvel-universe 4")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.6)
                .id(0)
            VStack{
                if !isWatchOS {
                    Text("splash.text")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.black)
                        .id(1)
                }
                Image("escudo Capitan américa")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: isWatchOS ? 80 : 200 , maxHeight:  isWatchOS ? 80 : 200)
                    .id(2)
                    
                }
            }
        }
    }

//MARK: - Preview
#Preview {
    SplashView()
}
