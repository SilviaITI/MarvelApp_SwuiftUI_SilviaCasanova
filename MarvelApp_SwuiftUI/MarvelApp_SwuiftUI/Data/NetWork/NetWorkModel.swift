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
        let urlBase = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=c4f3f162d0e23b27093e8929b8af94b6&hash=ec2facffc6252f40de0ae675c55244fb"
        var request: URLRequest = URLRequest(url: URL(string: urlBase)!)
        request.httpMethod = "GET"
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        return request
    }
    // url ejemplo https://gateway.marvel.com/v1/public/characters/101334/series?ts=1&apikey=c4f3f162d0e23b27093e8929b8af94b6&hash=ec2facffc6252f40de0ae675c55244fb
    func getSeries(with character: Character) -> URLRequest {
        
        let encodeID = "\(String(describing: character.id))".data(using: .utf8)?.base64EncodedString()
        let urlBaseseries = "https://gateway.marvel.com/v1/public/characters/\(encodeID ?? "")/series?ts=1&apikey=c4f3f162d0e23b27093e8929b8af94b6&hash=ec2facffc6252f40de0ae675c55244fb"
        var request: URLRequest = URLRequest(url: URL(string: urlBaseseries)!)
        request.httpMethod = "GET"
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        return request
    }
    
}
