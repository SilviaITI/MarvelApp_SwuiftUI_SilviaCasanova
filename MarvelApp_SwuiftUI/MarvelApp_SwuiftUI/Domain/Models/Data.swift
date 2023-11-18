//
//  Data.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import Foundation
public struct Data<T: Codable>: Codable {
    let data: Results<T>
}
