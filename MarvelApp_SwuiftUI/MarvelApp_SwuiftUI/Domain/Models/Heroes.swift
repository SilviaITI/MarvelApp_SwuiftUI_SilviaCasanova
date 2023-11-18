//
//  Character.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation



 public struct Heroes: Codable, Identifiable {
    
     public let id: Int?
     public let name: String?
     public let thumbnail: HeroImage?
     public let description: String?
     public var completeImage: String {
        "\(thumbnail?.path ?? "").\(thumbnail?.pathExtension ?? "")".replacingOccurrences(of: "http", with: "https")
       
    }
     init(id: Int?, name: String?, thumbnail: HeroImage?, description: String?) {
         self.id = id
         self.name = name
         self.thumbnail = thumbnail
         self.description = description
     }
}
public struct HeroImage: Codable {
    public let path: String?
    public let pathExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
}


