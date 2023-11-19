//
//  NetWorkModel.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
import Combine

enum NetworkModel {
    case getHeroes
    case getSeries(id: Int)
}

extension NetworkModel {
    
    
    var path: String {
        switch self {
        case .getHeroes:
            return "/v1/public/character"
        case .getSeries(let id):
            return "/v1/public/characters/\(id)/series"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getHeroes,
                .getSeries:
            return .get
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .getHeroes, .getSeries:
            let item1 = URLQueryItem(name: "ts", value: "1")
            let item2 = URLQueryItem(name: "apikey", value: "c4f3f162d0e23b27093e8929b8af94b6")
            let item3 = URLQueryItem(name: "hash", value: "ec2facffc6252f40de0ae675c55244fb")
            return [item1, item2, item3]
            
        }
    }
    
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var headers: [String: String]? {
        var header = NetworkModel.defaultHeaders
        if let body {
            header["Content-Length"] = "\(body.count)"
        }
        switch self {
            
        default: ()
        }
        return header
    }
    
    private static var defaultHeaders: [String: String] {
        return [
            "Accept": "application/json",
            "Content-type": "application/json"
        ]
    }
    
    var baseURL: String {
        "https://gateway.marvel.com"
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


extension URLRequest {
    // Método encargado de crear el request de la llamada al servicio
    static func request(networkRequest: NetworkModel) -> URLRequest {
        var bodyString = ""
        var comps = URLComponents(string: networkRequest.baseURL)
        comps?.path = networkRequest.path
        var request = URLRequest(url: (comps?.url)!)
        if let query = networkRequest.query {
            comps?.queryItems = query
        }
        if let body = networkRequest.body {
            request.httpBody = body
            bodyString = String(data: networkRequest.body!, encoding: .utf8) ?? ""
        }
        request.url = comps?.url
        request.httpMethod = networkRequest.method.rawValue
        request.allHTTPHeaderFields = networkRequest.headers
        print("💡 Headers: \(request.allHTTPHeaderFields ?? ["":""])")
        print("🚀", networkRequest.method.rawValue, comps?.url ?? "", bodyString)
        return request
    }
}
