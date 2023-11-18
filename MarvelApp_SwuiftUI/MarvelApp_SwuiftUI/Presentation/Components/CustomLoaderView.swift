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
        
        Image(.escudoCapitanAmérica)
            .rotationEffect(animate ? Angle(degrees: 360) : Angle(degrees: 0))
            .animation(animate ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : Animation.default)
            .onAppear {
                self.animate = loading
            }
            .onChange(of: loading) { newValue in
                self.animate = newValue
            }
    }
    
}




    



#Preview {
    CustomLoaderView(loading: .constant(true))
}
