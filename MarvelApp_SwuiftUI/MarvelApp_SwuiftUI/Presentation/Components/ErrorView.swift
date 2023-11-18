//
//  ErrorView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Ups parece que algo ha fallado")
        Image(systemName: "exclamationmark.triangle")
            .resizable()
            .frame(width: 150, height: 150)
    }
}

#Preview {
    ErrorView()
}
