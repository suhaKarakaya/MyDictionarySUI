//
//  DetailEndPoint.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

enum DetailEndpoint {
    case getKeySeachList(req: SearchRequestModel)
}

extension DetailEndpoint: Endpoint {
 
    var body: [String : Any]? {
        return nil
    }
    var path: [URLQueryItem] {
        switch self {
        case.getKeySeachList(let req):
           return [URLQueryItem(name: "ara", value: req.key ?? "")]
        }
        
    }
    
}
