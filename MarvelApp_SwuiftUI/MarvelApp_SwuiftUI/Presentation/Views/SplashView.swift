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
            Image(.marvelUniverse4)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.6)
            VStack{
                Text("¡¡Bienvenido a Marvel!!")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                CustomLoaderView(loading: .constant(true))
                 
                }
                
            }
        
        }
       
    }



#Preview {
    SplashView()
}
