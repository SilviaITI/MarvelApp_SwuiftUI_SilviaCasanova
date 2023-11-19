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
                    emptyMessage
                } else {
                    heroesList
                }
            }
            .navigationTitle("home.navigation_title")
            .fullScreenCover(isPresented: $viewModel.showError, content: {
                ErrorView(error: viewModel.errorText)
            })
    }
}
    // MARK: - Components
    var emptyMessage: some View {
        Group {
            VStack{
                Text("home.empty_message")
                    .padding()
                Image("pelea-marvel")
                    .resizable()
                    .frame(width: 300, height: 200)
                    .opacity(0.8)
                
            }
        }
    }
    var heroesList: some View {
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
            .navigationTitle("home.navigation_title")
            .background(.gray)
        }
    }
}

//MARK: - Preview
#Preview {
    CharactersView(viewModel: CharactersViewModel())
}
