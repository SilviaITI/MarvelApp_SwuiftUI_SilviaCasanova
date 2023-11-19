//
//  LoadingView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    // MARK: - Properties
    @Binding var isLoading: Bool
    let content: ()-> Content
    
    // MARK: - Principal View
    var body: some View {
        ZStack{
            content()
            if isLoading {
                Group{
                    Color.white
                        .ignoresSafeArea()
                    
                    CustomLoaderView(loading: $isLoading)
                }
            }
        }
    }
    
    // MARK: - Components
    struct CustomLoaderView: View {
        // MARK: - Properties
        @Binding var loading: Bool
        @State var animate =  false
        
        // MARK: - Principal View
        var body: some View {
            Image("escudo Capitan américa")
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

}

// MARK: - Preview
#Preview {
    LoadingView(isLoading: .constant(true), content: {EmptyView()})
}
