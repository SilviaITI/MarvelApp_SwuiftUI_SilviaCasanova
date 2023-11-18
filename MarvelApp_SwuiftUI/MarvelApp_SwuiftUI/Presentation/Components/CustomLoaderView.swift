//
//  CustomLoaderView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import SwiftUI

struct CustomLoaderView: View {

    @Binding  var isRotating: Bool
    
        var body: some View {
            Image(.escudoCapitanAmérica)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(0.5).repeatForever(autoreverses: false)) {
                            isRotating.toggle()
                        }
                }}
    }

#Preview {
    CustomLoaderView(isRotating: .constant(true))
}
