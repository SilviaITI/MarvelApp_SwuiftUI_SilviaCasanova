//
//  DetailViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
 
    @Published var series:[Serie] = []
    @Published var character: Character
    
    var subscribers = Set<AnyCancellable>()
    
    init(testing: Bool = false, character: Character) {
        self.character = character
        if (testing) {
            getSeriesTesting()
        } else {
            getSeries(id: character.id)
        }
    }
    
    func getSeries(id: Int?) {
        guard let id else { return }
        URLSession.shared.dataTaskPublisher(for: NetWorkModel().getSeries(with: id))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Error bad server")
                    throw URLError(.badServerResponse)
                }
                print("received response \($0.data.base64EncodedString())")
                return $0.data
                
            }
            .decode(type: Data<Serie>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    print("Error al cargar los datos")
                case .finished:
                   print("Success ok")
                }
            } receiveValue: { (response: Data<Serie>) in
                self.series = response.data.results
                print("\(self.series)")
            }
            .store(in: &subscribers)
            }
    
    func getSeriesTesting() {
        //self.status = .loading
        self.series = getSeriesDesign()
        //self.status = .loaded
    }
    func getSeriesDesign() -> [Serie] {
        let serie1 = Serie(id: 123, title: "Los Cuatro Fantásticos", description: "Esta es una descripción de prueba.", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
        let serie2 = Serie(id: 123, title: "SpiderMan", description: "esta es una descripción de prueba", thumbnail:  SerieImage.init(path: "camera", pathExtension: ".fill"))
        let serie3 = Serie(id: 123, title: "Iron Man", description: "esto es una descripcionde prueba", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
        return [serie1, serie2, serie3]
    }
    
}
