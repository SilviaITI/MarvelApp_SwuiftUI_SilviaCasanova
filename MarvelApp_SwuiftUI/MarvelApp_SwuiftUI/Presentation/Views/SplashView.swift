//
//  SplashView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
    
        ZStack {
            Image("Marvel-universe 4")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.6)
                .id(0)
            VStack{
                Text("¡¡Bienvenido a Marvel!!")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                    .id(1)
                Image("escudo Capitan américa")
                    .id(2)
                }
                
            }
        
        }
       
    }



#Preview {
    SplashView()
}
