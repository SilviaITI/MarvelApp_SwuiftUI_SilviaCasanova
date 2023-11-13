//
//  Character.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation

struct Data: Codable {
    let data: Results
}
struct Results: Codable {
    let results: [Character]
}
struct Character: Codable, Identifiable {
    
    let id: Int?
    let name: String?
    let thumbnail: HeroImage?
    let description: String?
    var completeImage: String {
        "\(thumbnail?.path ?? "").\(thumbnail?.pathExtension ?? "")".replacingOccurrences(of: "http", with: "https")
    
    }
   
}
struct HeroImage: Codable {
    let path: String?
    let pathExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
}


