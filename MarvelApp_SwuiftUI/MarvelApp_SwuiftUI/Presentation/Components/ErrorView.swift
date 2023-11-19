//
//  ErrorView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import SwiftUI

struct ErrorView: View {
    @Environment (\.dismiss) var dismiss
    let error: String
    
    var body: some View {
       
            VStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                })
                .id(0)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                Spacer()
                Text(error)
                    .id(1)
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
                    .id(1)
                Spacer()
            }
        }
        
    }


#Preview {
    ErrorView(error: "Error de prueba")
}
