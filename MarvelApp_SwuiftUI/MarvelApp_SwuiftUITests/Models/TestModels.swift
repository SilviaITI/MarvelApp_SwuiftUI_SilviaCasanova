//
//  TestModels.swift
//  MarvelApp_SwuiftUITests
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import XCTest
@testable import MarvelApp_SwuiftUI
final class TestModels: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelHeroes() throws {
        let modelHeroes = Heroes( id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción")
        XCTAssertNotNil(modelHeroes)
        XCTAssertEqual(modelHeroes.id, 123)
        XCTAssertEqual(modelHeroes.name, "Capitan America")
        XCTAssertEqual(modelHeroes.thumbnail?.path, "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087")
        XCTAssertEqual(modelHeroes.thumbnail?.pathExtension, ".jpg")
        XCTAssertEqual(modelHeroes.description, "esto es una descripción")
    }
    
    let serie1 = Serie(id: 123, title: "Los Cuatro Fantásticos", description: "Esta es una descripción de prueba.", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
    let serie2 = Serie(id: 123, title: "SpiderMan", description: "esta es una descripción de prueba", thumbnail:  SerieImage.init(path: "camera", pathExtension: ".fill"))
    let serie3 = Serie(id: 123, title: "Iron Man", description: "esto es una descripcionde prueba", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
    
    
    func testModelSeries() throws {
        let modelSeries = Serie(id: 123, title: "Los Cuatro Fantásticos", description: "Esta es una descripción de prueba.", thumbnail: SerieImage.init(path: "camera", pathExtension: ".fill"))
        XCTAssertNotNil(modelSeries)
        XCTAssertEqual(modelSeries.id, 123)
        XCTAssertEqual(modelSeries.title, "Los Cuatro Fantásticos")
        XCTAssertEqual(modelSeries.description, "Esta es una descripción de prueba.")
        XCTAssertEqual(modelSeries.thumbnail?.path, "camera")
        XCTAssertEqual(modelSeries.thumbnail?.pathExtension, ".fill")
        
    }
    func testStatus() throws {
        func testNoneStatus() {
                let status: Status = .none
                XCTAssertTrue(status == .none, "El estado debería ser 'none'")
            }

            func testLoadedStatus() {
                let status: Status = .loaded
                XCTAssertTrue(status == .loaded, "El estado debería ser 'loaded'")
            }

            func testLoadingStatus() {
                let status: Status = .loading
                XCTAssertTrue(status == .loading, "El estado debería ser 'loading'")
            }

            func testErrorStatus() {
                let errorMessage = "Error en la carga"
                let status: Status = .error(error: errorMessage)
                
                if case .error(let error) = status {
                    XCTAssertEqual(error, errorMessage, "El mensaje de error no coincide")
                } else {
                    XCTFail("Se esperaba un estado de error con un mensaje")
                }
            }
    }
    
    

}
