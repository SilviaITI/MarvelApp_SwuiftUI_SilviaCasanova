//
//  StatusModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation

enum Status: Equatable {
    
    case none
    case loaded
    case loading
    case error(error: String)
  
}
