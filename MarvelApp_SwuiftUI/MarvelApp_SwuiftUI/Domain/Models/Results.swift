//
//  Results.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import Foundation
public struct Results<T: Codable>: Codable {
    let results: [T]
}
