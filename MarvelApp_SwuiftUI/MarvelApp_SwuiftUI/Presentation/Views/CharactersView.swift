//
//  CharactersView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) { data in
                    CharacterCellView(character: data)
                    
                }
            }
        }
    }
}

#Preview {
   
    CharactersView(viewModel: CharactersViewModel())
    
}
