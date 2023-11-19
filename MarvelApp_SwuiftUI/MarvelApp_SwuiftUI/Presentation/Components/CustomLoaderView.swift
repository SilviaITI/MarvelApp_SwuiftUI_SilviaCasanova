//
//  CustomLoaderView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import SwiftUI

struct CustomLoaderView: View {
    
    @Binding var loading: Bool
    @State var animate =  false
    
    
    var body: some View {
        
        Image("escudoCapitanAmérica")
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: animate)
        
            .opacity(loading ? 1 : 0)
            .onAppear {
                animate = loading
            }
            .onChange(of: loading) { newValue in
                animate = newValue
            }
    }
    
}


#Preview {
    CustomLoaderView(loading: .constant(true))
}
