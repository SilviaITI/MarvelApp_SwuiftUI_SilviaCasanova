//
//  CharactersView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI

struct CharactersView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = CharactersViewModel()
    
    // MARK: - Principal View
    var body: some View {
        LoadingView(isLoading: $viewModel.isLoading) {
            Group{
                if viewModel.characters.isEmpty {
                    EmptyMessage
                } else {
                    HeroesList
                }
            }
            .navigationTitle("Héroes")
            .fullScreenCover(isPresented: $viewModel.showError, content: {
                ErrorView(error: viewModel.errorText)
            })
    }
}
    // MARK: - Components
    var EmptyMessage: some View {
        Group {
            VStack{
                Text("Estamos ocupados salvando el mundo, por favor intentelo más tarde")
                    .padding()
                Image("futuraPeleaMarvel5120X2880Xtrafondos1")
                    .resizable()
                    .frame(width: 300, height: 200)
                    .opacity(0.8)
                
            }
        }
    }
    var HeroesList: some View {
        Group {
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

//MARK: - Preview
#Preview {
    CharactersView(viewModel: CharactersViewModel())
}
