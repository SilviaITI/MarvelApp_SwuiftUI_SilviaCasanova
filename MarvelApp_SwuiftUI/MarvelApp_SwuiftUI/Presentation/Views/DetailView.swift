//
//  DetailView.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import SwiftUI

struct DetailView: View {
    
    //MARK: -Properties
    @StateObject var viewModel: DetailViewModel
  
    // MARK: - Principal View
    var body: some View {
        LoadingView(isLoading: $viewModel.isLoading) {
            ZStack {
                AsyncImage(url: URL(string:viewModel.character.completeImage), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .opacity(0.2)
                        .cornerRadius(20)
                }, placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .opacity(0.2)
                })
                .id(0)
#if os(watchOS)
                
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0, 
                       maxHeight: .infinity,
                       alignment: .topLeading)
#else
                .frame(minWidth: UIScreen.main.bounds.width,
                       maxHeight: .infinity)
#endif
                if isWatchOS {
                    seriesSectionWOS
                } else {
                    seriesSectioniOS
                }
            }
            
            .navigationTitle(viewModel.character.name ?? "_")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
        
        }
    }
    
    // MARK: - Components
    var seriesSectioniOS: some View {
        VStack{
            Text(viewModel.character.description ?? "")
                .padding()
                .background(Color.white.opacity(0.3))
                .id(1)
            Text("Series en las que aparece")
                .bold()
                .font(.title)
            ScrollView {
                LazyVStack(alignment: .leading){
                    ForEach(viewModel.series) { data in
                        HStack {
                            AsyncImage(url: URL(string: data.completeImage), content: { image in
                                image
                                    .resizable()
                                    .cornerRadius(20)
                            }, placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                            })
                            .id(1)
                            .frame(width: 200, height: 200)
                            
                            Text(data.title ?? "-")
                                .bold()
                                .id(2)
                        }
                        .padding(.leading, 12)
                    }
                }
            }
        }
        .padding()
    }
    var seriesSectionWOS: some View {
        VStack{
            Text("Series en las que aparece")
            ScrollView {
                LazyVStack(alignment: .leading){
                    ForEach(viewModel.series) { data in
                        HStack {
                            AsyncImage(url: URL(string: data.completeImage), content: { image in
                                image
                                    .resizable()
                                    .cornerRadius(20)
                            }, placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                
                            })
                            .id(1)
                            .frame(width: 150, height: 150)
                            
                        }
                        .padding(.leading, 0)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(character: Heroes(id: 123, name: "Capitan America", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "Esta es una descripción generica del personaje que se muestra en el detalle")))
}
