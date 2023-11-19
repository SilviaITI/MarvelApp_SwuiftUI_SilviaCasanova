//
//  TestViews.swift
//  MarvelApp_SwuiftUITests
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import XCTest
import ViewInspector
@testable import MarvelApp_SwuiftUI
final class TestViews: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRootView() throws {
        let viewModel = RootViewModel()
        viewModel.status = .splash
        let view = RootView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
    }
    func testCharactersView() throws {
       
        let view = CharactersView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
    }
    func testSplash() throws {
        let view = SplashView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems,1)
        
        let image1 = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image1)
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        let image2 = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(image2)
        
        
    }
    func testDetailView() throws {
        let modelHeroes = Heroes( id: 123, name: "Capitan America", thumbnail: HeroImage(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", pathExtension: ".jpg"), description: "esto es una descripción")
        let viewModel = DetailViewModel(character: modelHeroes)
        let view = DetailView(viewModel: viewModel)
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems,1)
        
    }
    

}
