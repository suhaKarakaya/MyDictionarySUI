//
//  JsonToModelConvertManager.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import Foundation

public final class JsonToModelConvert {
    
    public static let shared = JsonToModelConvert()
    
    public func convertJson<T: Decodable>(typeModel: T.Type) async -> Result<T, RequestError> {
        guard let path = Bundle.main.path(forResource: "autho", ofType: "json") else {
            return .failure(.decode)
        }
        let url = URL(filePath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(typeModel.self, from: data)
            return .success(jsonData)
        } catch {
            return .failure(.unknown)
        }
    }
    
    
}
