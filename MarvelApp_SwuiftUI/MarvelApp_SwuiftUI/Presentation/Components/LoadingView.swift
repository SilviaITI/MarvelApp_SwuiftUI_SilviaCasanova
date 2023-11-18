//
//  LoadingView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    @Binding var isLoading: Bool
    let content:()->Content
    
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
}

#Preview {
    LoadingView(isLoading: .constant(true), content: {EmptyView()})
}
