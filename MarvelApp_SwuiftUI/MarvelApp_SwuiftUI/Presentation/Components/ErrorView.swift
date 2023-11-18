//
//  ErrorView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import SwiftUI

struct ErrorView: View {
    @State var error: String = ""
    var body: some View {
        VStack{
            Text(error)
                .id(0)
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 150, height: 150)
                .id(1)
        }
    }
}

#Preview {
    ErrorView()
}
