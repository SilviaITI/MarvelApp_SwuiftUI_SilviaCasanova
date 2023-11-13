//
//  CharacterCellView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 13/11/23.
//

import SwiftUI

struct CharacterCellView: View {
    let character: Character
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.completeImage), content: { image in
               image
                    .resizable()
                    .opacity(0.8)
                    .cornerRadius(20)
            }, placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(0.8)
            })
                .frame(width: 300, height: 200)
            Text(character.name ?? "-")
                
        }
        .padding()
        
    }
}

#Preview {
    CharacterCellView(character: Character(id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción"))
}
