//
//  CharactersViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

final class CharactersViewModel: ObservableObject {
    
    
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
                    print("error bad server")
                    throw URLError(.badServerResponse)
                    
                }
                print("received response\($0.data.base64EncodedString())")
                return $0.data
            }
            .decode(type: Data.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Error buscando personajes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { response  in
                self.characters = response.data.results
                print("\(self.characters)")
            }
            .store(in: &subscribers)
    }
    func getCharactersTesting() {
        self.status = .loading
        self.characters = getCharactersDesign()
        self.status = .loaded
    }
    
    func getCharactersDesign() -> [Character] {
        let character1 = Character(id: 123, name: "Capitan America", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character2 = Character(id: 124, name: "Spiderman", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character3 = Character(id: 125, name: "Capitana Marvel", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character4 = Character(id: 126, name: "Black Panter", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        return [character1, character2, character3, character4]
    }
}
