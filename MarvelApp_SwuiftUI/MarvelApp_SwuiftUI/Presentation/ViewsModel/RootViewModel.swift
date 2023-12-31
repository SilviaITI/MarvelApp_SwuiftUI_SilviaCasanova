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
    // Modifica el estado de la vista para que realice automáticamente la navegación de Splash a Home
    func changeState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [ weak self]  in
            self?.status = .home
        }
    }
}
