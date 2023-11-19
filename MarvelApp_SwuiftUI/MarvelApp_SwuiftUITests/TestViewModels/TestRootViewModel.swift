//
//  TestRootViewModel.swift
//  MarvelApp_SwuiftUITests
//
//  Created by Silvia Casanova Martinez on 19/11/23.
//

import XCTest
@testable import MarvelApp_SwuiftUI

final class TestRootViewModel: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func testChangeState() {
        let viewModel = RootViewModel()

        XCTAssertEqual(viewModel.status, .splash)
        viewModel.changeState()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            XCTAssertEqual(viewModel.status, .home)
        }
    }


}
