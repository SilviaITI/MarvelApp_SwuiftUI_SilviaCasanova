//
//  RootViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

enum RootState {
    case home
    case splash
    case error
}
final class RootViewModel: ObservableObject {
    @Published var status = RootState.splash
    @Published var errorString: String = ""
    
    func changeState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [ weak self]  in
            self?.status = .home
        }
    }
}
