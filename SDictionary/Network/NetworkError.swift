//
//  NetworkError.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

public enum NetworkError: Error {
    case parseError
    case badUrlError
    case badRequestError
}
