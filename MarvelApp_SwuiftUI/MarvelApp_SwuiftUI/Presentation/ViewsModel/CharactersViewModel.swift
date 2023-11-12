//
//  CharactersViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

final class CharactersViewModel {
    
    
    @Published var status = Status.none
    @Published var characters:[Character] = []
    
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
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Character].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Error buscando personajes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data  in
                self.characters = data
            }
            .store(in: &subscribers)
    }
    func getCharactersTesting() {
        self.status = .loading
        self.characters = getCharactersDesign()
        self.status = .loaded
    }
    
    func getCharactersDesign() -> [Character] {
        let character1 = Character(id: 123, name: "Capitan America")
        let character2 = Character(id: 124, name: "Spiderman")
        let character3 = Character(id: 125, name: "Capitana Marvel")
        let character4 = Character(id: 126, name: "Black Panter")
        return [character1, character2, character3, character4]
    }
}
