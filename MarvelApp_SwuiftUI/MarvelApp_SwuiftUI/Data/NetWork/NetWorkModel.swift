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
    
    
}
struct Content {
    static let content = "application/json"
    static let contentType = "Content-Type"
}
struct Urls {
    static let urlBase = "https://gateway.marvel.com"
    static let endPointCharacters = "/v1/public/characters?"
    static let endPointCharacters2 = "/v1/public/characters"
    static let endPointSeries = "/series?"
    static let ts = "ts=1"
    static let apiKey = "&apikey=c4f3f162d0e23b27093e8929b8af94b6"
    static let hash = "&hash=ec2facffc6252f40de0ae675c55244fb"
    static let credentials = "\(ts)\(apiKey)\(hash)"
}

struct UrlBase {
    static let characters = "\(Urls.urlBase)\(Urls.endPointCharacters)\(Urls.credentials)"
    static let series = "\(Urls.urlBase)\(Urls.endPointCharacters)\(Urls.endPointSeries)"
}
struct NetWorkModel {
    
    //https://gateway.marvel.com/v1/public/characters?ts=1&apikey=c4f3f162d0e23b27093e8929b8af94b6&hash=ec2facffc6252f40de0ae675c55244fb
    

    
    func getApiCharacters() -> URLRequest {
        let url = "\(Urls.urlBase)\(Urls.endPointCharacters)\(Urls.credentials)"
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(Content.content, forHTTPHeaderField: Content.contentType)
        print(request)
        
        return request
        
    }
    
    //    func getApiCharacters() -> URLRequest? {
    //        let baseURL = "https://gateway.marvel.com"
    //        let getCharacters = "/v1/public/characters"
    //        let apiKey = "c4f3f162d0e23b27093e8929b8af94b6"
    //        var urlComponents = URLComponents(string: baseURL + getCharacters)
    //
    //        let queryItems: [URLQueryItem] = [
    //              URLQueryItem(name: "ts", value: "1"),
    //              URLQueryItem(name: "apiKey", value: apiKey),
    //              URLQueryItem(name: "hash", value: "ec2facffc6252f40de0ae675c55244fb")
    //          ]
    //
    //        urlComponents?.queryItems = queryItems
    //        guard let url = urlComponents?.url else {
    //               // Manejar el caso en el que la URL no se pudo construir
    //               print("Error al construir la URL")
    //               return nil
    //           }
    //
    //        var request: URLRequest = URLRequest(url: url)
    //        request.httpMethod = HTTPMethods.get
    //        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
    //        print(request)
    //        return request
    //    }
    
    // url ejemplo https://gateway.marvel.com/v1/public/characters/101334/series?ts=1&apikey=c4f3f162d0e23b27093e8929b8af94b6&hash=ec2facffc6252f40de0ae675c55244fb
    
    func getSeries(with id: Int) -> URLRequest {
        let url = "\(Urls.urlBase)\(Urls.endPointCharacters2)/\(id)\(Urls.endPointSeries)\(Urls.credentials)"
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(Content.content, forHTTPHeaderField: Content.contentType)
        return request
    }
    
    
}


//enum NetWorkModel {
//    case getHeroes
//    case getSeries(id: Int)
//}
//
//extension NetWorkModel {
//    
//    var path: String {
//        switch self {
//        case .getHeroes:
//            return "/v1/public/characters"
//        case .getSeries(let id):
//            return "/v1/public/characters/\(id)/series"
//        }
//    }
//    
//    var method: HTTPMethod {
//        switch self {
//        case .getHeroes,
//                .getSeries:
//            return .get
//        }
//    }
//    
//    var query: [URLQueryItem]? {
//        switch self {
//        case .getHeroes, .getSeries:
//            let item1 = URLQueryItem(name: "ts", value: "1")
//            let item2 = URLQueryItem(name: "apikey", value: "c4f3f162d0e23b27093e8929b8af94b6")
//            let item3 = URLQueryItem(name: "hash", value: "ec2facffc6252f40de0ae675c55244fb")
//            return [item1, item2, item3]
//        default:
//            return nil
//        }
//    }
//    
//    var body: Data? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//    
//    var headers: [String: String]? {
//        var header = NetWorkModel.defaultHeaders
//        if let body {
//            header["Content-Length"] = "\(body.count)"
//        }
//        switch self {
//            
//        default: ()
//        }
//        return header
//    }
//    
//    private static var defaultHeaders: [String: String] {
//        return [
//            "Content-Type": "application/json"
//        ]
//    }
//    
//    var baseURL: String {
//        "https://gateway.marvel.com"
//    }
//}
//
//enum HTTPMethod: String {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case delete = "DELETE"
//}
//
//extension URLRequest {
//    static func request(networkRequest: NetWorkModel) -> URLRequest {
//        var bodyString = ""
//        var comps = URLComponents(string: networkRequest.baseURL)
//        comps?.path = networkRequest.path
//        var request = URLRequest(url: (comps?.url)!)
//        if let query = networkRequest.query {
//            comps?.queryItems = query
//        }
//        if let body = networkRequest.body {
//            request.httpBody = body
//            bodyString = String(data: networkRequest.body!, encoding: .utf8) ?? ""
//        }
//        request.httpMethod = networkRequest.method.rawValue
//        request.allHTTPHeaderFields = networkRequest.headers
//        print("💡 Headers: \(request.allHTTPHeaderFields ?? ["":""])")
//        print("🚀", networkRequest.method.rawValue, comps?.url ?? "", bodyString)
//        return request
//    }
