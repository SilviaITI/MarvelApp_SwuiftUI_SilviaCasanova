//
//  RootViewModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation

//MARK: - Enum States
enum RootState {
    case home
    case splash
}

// MARK: - Class
final class RootViewModel: ObservableObject {
    // MARK: - Properties
    @Published var status = RootState.splash
    
    // MARK: - Public functions
    func changeState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [ weak self]  in
            self?.status = .home
        }
    }
}
