//
//  TestDetailViewModel.swift
//  MarvelApp_SwuiftUITests
//
//  Created by Silvia Casanova Martinez on 19/11/23.
//

import XCTest
import Combine
@testable import MarvelApp_SwuiftUI

final class TestDetailViewModel: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCharacters() throws {
        let characterTest = Heroes( id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción")
        let expectation = self.expectation(description: "Descarga héroes")
        var subscribers = Set<AnyCancellable>()
        
        let viewModel = DetailViewModel(testing: true, character: characterTest)
        XCTAssertNotNil(viewModel)
        
        viewModel.series.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &subscribers)
        viewModel.getSeriesTesting()
        self.waitForExpectations(timeout: 8)
    }
    func testHandleViewStatesLoaded() {
        let characterTest = Heroes( id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción")
        let viewModel = DetailViewModel(testing: true, character: characterTest)
        viewModel.status = .loaded

        viewModel.handleViewStates()

           XCTAssertFalse(viewModel.isLoading, "Cuando el estado es 'loaded', isLoading debe ser falso.")
       }

       func testHandleViewStatesLoading() {
           let characterTest = Heroes( id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción")
           let viewModel = DetailViewModel(testing: true, character: characterTest)
           viewModel.status = .loading

           viewModel.handleViewStates()

           XCTAssertTrue(viewModel.isLoading, "Cuando el estado es 'loading', isLoading debe ser verdadero.")
       }

       func testHandleViewStatesError() {
         
           let viewModel = CharactersViewModel(testing: true)
           let errorMessage = "Error de prueba"
           viewModel.status = .error(error: errorMessage)

           viewModel.handleViewStates()

           XCTAssertFalse(viewModel.isLoading, "Cuando el estado es 'error', isLoading debe ser falso.")
           XCTAssertTrue(viewModel.showError, "Cuando el estado es 'error', showError debe ser verdadero.")
           XCTAssertEqual(viewModel.errorText, errorMessage, "El mensaje de error debe coincidir con el proporcionado.")
       }

}
