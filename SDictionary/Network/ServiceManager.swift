//
//  NetworkManager.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation
import Alamofire

final class ServiceManager {
    static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    func fetch<T>(path: String, onSuccess: @escaping (T) -> (), onError: @escaping (AFError) -> ()) where T: Codable {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of : T.self) { response in
            guard let model = response.value else { onError(response.error ?? .invalidURL(url: "")); return }
            onSuccess(model)
        }
    }
}
