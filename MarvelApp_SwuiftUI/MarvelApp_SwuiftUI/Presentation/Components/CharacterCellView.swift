//
//  CharacterCellView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 13/11/23.
//

import SwiftUI

struct CharacterCellView: View {
    // MARK: - Properties
    let character: Heroes
    
    // MARK: - Principal View
    var body: some View {
        VStack {
#if os(watchOS)
            heroImageWOS
#else
            heroImageiOS
#endif
        }
        .padding()
    }
   // MARK: - Componentes
    var heroImageWOS: some View {
        Group {
            // Código específico para watchOS
            AsyncImage(url: URL(string: character.completeImage), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .opacity(0.8)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }, placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .opacity(0.8)
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 10)
            Text(character.name ?? "-")
                .font(.caption)
        }
    }
    var heroImageiOS: some View {
        Group {
            AsyncImage(url: URL(string: character.completeImage), content: { image in
                image
                    .resizable()
                    .opacity(0.8)
                    .border(Color.black, width: 2.5)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 2, y: 10)
            }, placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(0.8)
            })
            .frame(width: 300, height: 200)
            
            Text(character.name ?? "-")
                .font(.title3)
        }
    }
}
 // MARK: - Preview
#Preview {
    CharacterCellView(character: Heroes(id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción"))
}
