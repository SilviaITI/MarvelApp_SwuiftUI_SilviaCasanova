//
//  DetailView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    var body: some View {
        
            ZStack {
                AsyncImage(url: URL(string:viewModel.character.completeImage), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .opacity(0.3)
                        .cornerRadius(20)
                }, placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .opacity(0.2)
                })
                .frame(maxHeight: .infinity)
                ScrollView {
                LazyVStack{
                    ForEach(viewModel.series) { data in
                        VStack {
                            Text(data.title ?? "-")
                                .font(.title2)
                                .bold()
                        HStack {
                            AsyncImage(url: URL(string: data.completeImage), content: { image in
                                image
                                    .resizable()
                                    .opacity(0.8)
                                    .cornerRadius(20)
                            }, placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .opacity(0.8)
                            })
                            .frame(width: 200, height: 200)
                          
//                                Text(data.description ?? "Esto es una descripción")
                            }
                        }
                    }
                }
                .padding()
            }
                .padding()
        }
            .navigationTitle(viewModel.character.name ?? "_")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
    }
}
#Preview {
    DetailView(viewModel: DetailViewModel(character: Character(id: 123, name: "Capitan America", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")))
}
