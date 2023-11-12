//
//  NetWorkModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}
struct NetWorkModel {
    
    
    func getApiCharacters() -> URLRequest {
        let urlBase = "https://gateway.marvel.com:443/v1/public/characters/1011334?apikey=c4f3f162d0e23b27093e8929b8af94b6"
        var request: URLRequest = URLRequest(url: URL(string: urlBase)!)
        request.httpMethod = "GET"
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
    }
    
}


