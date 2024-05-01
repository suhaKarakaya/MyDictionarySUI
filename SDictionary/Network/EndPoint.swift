//
//  EndPoint.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: [URLQueryItem] { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}


public extension Endpoint {
    
    var scheme: String {
        return "https://"
    }
    var host: String {
        return "sozluk.gov.tr/gts"
    }
   
    var method: RequestMethod {
        return .post
    }
    
    var header: [String: String]? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = String(format: "%@%@", scheme,host)
        var urlComps = URLComponents(string: url)!
        urlComps.queryItems = path
        var urlRequest: URLRequest?
        if let result = urlComps.url {
            urlRequest = URLRequest(url: result)
        }
        
        // HTTP Method
        urlRequest?.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Parameters
        if let parameters = body {
            do {
                urlRequest?.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw RequestError.invalidURL
            }
        }
    
        return urlRequest!
    }
}
