//
//  CharactersViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

final class CharactersViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var isLoading = false
    @Published var showError = false
    @Published var characters: [Heroes] = []
    @Published var errorText = ""
    
    var status = Status.none {
        didSet{
            handleViewStates()
        }
    }
    var subscribers = Set<AnyCancellable>()
    
    // MARK: - Inizializers
    init(testing: Bool = false) {
        if (testing) {
            getCharactersTesting()
        } else {
            getCharacters()
        }
    }
    
    // MARK: - Api functions
    // Llamada al servicio que obtiene un result que contiene el listado de personajes
    func getCharacters() {
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: .request(networkRequest: .getHeroes))
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
                    self?.status = .error(error: "error.text")
                case .finished:
                    self?.status = .loaded
                }
            } receiveValue: { [weak self] (response: DataResponse<Heroes>)  in
                self?.characters = response.data.results
                
            }
            .store(in: &subscribers)
    }
    
    // MARK: - Public functions
    // Modifica los estados de la vista para manejar errores, vista de carga y si la vista está cargada
    func handleViewStates() {
        DispatchQueue.main.async { [weak self] in
            switch self?.status {
            case .loaded:
                self?.isLoading = false
            case .loading:
                self?.isLoading = true
            case .error(let error):
                self?.isLoading = false
                self?.showError = true
                self?.errorText = error
            default: ()
            }
        }
    }
    
    // Función de carga de personajes para testing
    func getCharactersTesting() {
        self.status = .loading
        self.characters = getCharactersDesign()
        self.status = .loaded
    }
    
    // Personajes ficticios creados para testing
    func getCharactersDesign() -> [Heroes] {
        let character1 = Heroes(id: 123, name: "Capitan America", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character2 = Heroes(id: 124, name: "Spiderman", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character3 = Heroes(id: 125, name: "Capitana Marvel", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        let character4 = Heroes(id: 126, name: "Black Panter", thumbnail: HeroImage.init(path: "camera", pathExtension: ".fill"), description: "")
        return [character1, character2, character3, character4]
    }
}
