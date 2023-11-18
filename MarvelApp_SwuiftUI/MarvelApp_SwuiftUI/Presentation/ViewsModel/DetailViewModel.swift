//
//  DetailViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 14/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
 
    
    @Published var status = Status.none {
        didSet{
            handleViewStates()
        }
    }
    @Published var isLoading = false
    @Published var showError = false
    @Published var series:[Serie] = []
    @Published var character: Heroes
    @Published var errorText = ""
    
    var subscribers = Set<AnyCancellable>()
    
    init(testing: Bool = false, character: Heroes) {
        self.character = character
        if (testing) {
            getSeriesTesting()
        } else {
            getSeries(id: character.id)
        }
    }
    
    func getSeries(id: Int?) {
        guard let id else { return }
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: NetWorkModel().getSeries(with: id))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error al construir url")
                    throw URLError(.badServerResponse)
                }
                print("received response \($0.data.base64EncodedString())")
                return $0.data
                
            }
            .decode(type: DataResponse<Serie>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Error al recibir los datos del héroe")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { [weak self] (response: DataResponse<Serie>) in
                self?.series = response.data.results
                
            }
            .store(in: &subscribers)
            }
    func handleViewStates() {
        switch status {
        case .loaded:
            isLoading = false
        case .loading:
            isLoading = true
        case .error(let error):
            isLoading = false
            showError = true
            errorText = error
        default: ()
            
        }
    }
    func getSeriesTesting() {
        self.status = .loading
        self.series = getSeriesDesign()
        self.status = .loaded
    }
    func getSeriesDesign() -> [Serie] {
        let serie1 = Serie(id: 123, title: "Los Cuatro Fantásticos", description: "Esta es una descripción de prueba.", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
        let serie2 = Serie(id: 123, title: "SpiderMan", description: "esta es una descripción de prueba", thumbnail:  SerieImage.init(path: "camera", pathExtension: ".fill"))
        let serie3 = Serie(id: 123, title: "Iron Man", description: "esto es una descripcionde prueba", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
        return [serie1, serie2, serie3]
    }
    
}
