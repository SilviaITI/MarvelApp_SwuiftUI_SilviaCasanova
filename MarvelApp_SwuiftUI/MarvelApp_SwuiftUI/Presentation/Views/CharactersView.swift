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
            LoadingView(isLoading: $viewModel.isLoading) {
                List {
                    ForEach(viewModel.characters) { data in
                        NavigationLink {
                            DetailView(viewModel: DetailViewModel(character: data))
                        } label : {
                            CharacterCellView(character: data)
                            
                        }
                    }
                    
                }
                .id(0)
                .navigationTitle("Héroes")
                .background(.gray)
            }
    }
}
#Preview {
   
    CharactersView(viewModel: CharactersViewModel())
    
}
