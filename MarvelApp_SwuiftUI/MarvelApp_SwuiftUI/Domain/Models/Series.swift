//
//  Series.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 13/11/23.
//

import Foundation


struct Serie: Codable, Identifiable {

    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: SerieImage?
    var completeImage: String {
        "\(thumbnail?.path ?? "").\(thumbnail?.pathExtension ?? "")".securePath
    }
}
struct SerieImage: Codable {
    let path: String?
    let pathExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
}
