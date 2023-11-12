//
//  StatusModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
enum Status {
    case none
    case loaded
    case loading
    case navigatetoDetail
    case error(error: String)
}
