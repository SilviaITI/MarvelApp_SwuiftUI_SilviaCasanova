//
//  Data.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 18/11/23.
//

import Foundation

public struct DataResponse<T: Codable>: Codable {
    let data: Results<T>
}
