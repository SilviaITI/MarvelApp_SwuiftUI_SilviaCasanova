//
//  CharactersViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

final class CharactersViewModel: ObservableObject {
    
    
    @Published var status = Status.none {
        didSet{
            handleViewStates()
        }
    }
    @Published var isLoading = false
    @Published var showError = false
    @Published var characters:[Heroes] = []
    @Published var errorText = ""
    
    var subscribers = Set<AnyCancellable>()
    
    init(testing: Bool = false) {
        if (testing) {
            getCharactersTesting()
        } else {
            getCharacters()
        }
    }
    
    func getCharacters() {
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: NetWorkModel().getApiCharacters())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                    
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error al construir url")
                    throw URLError(.badServerResponse)
                    
                }
                print("received response\($0.data.base64EncodedString())")
                return $0.data
            }
            .decode(type: DataResponse<Heroes>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                switch completion {
                case .failure:
                    self?.status = .error(error: "Error buscando personajes")
                case .finished:
                    self?.status = .loaded
                }
            } receiveValue: { [weak self] (response: DataResponse<Heroes>)  in
                self?.characters = response.data.results
                
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
    
    func getCharactersTesting() {
        self.status = .loading
        self.characters = getCharactersDesign()
        self.status = .loaded
    }
    
    func getCharactersDesign() -> [Heroes] {
        let character1 = Heroes(id: 123, name: "Capitan America", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character2 = Heroes(id: 124, name: "Spiderman", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character3 = Heroes(id: 125, name: "Capitana Marvel", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character4 = Heroes(id: 126, name: "Black Panter", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        return [character1, character2, character3, character4]
    }
}
