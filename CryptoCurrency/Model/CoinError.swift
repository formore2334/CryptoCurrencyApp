//
//  CoinError.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import Foundation


enum CoinError: Error, LocalizedError {
    case invalidData
    case invalidURL
    case serverError
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return "The coin data is invalid. Please try again later"
        case .invalidURL:
           return "OOPS..Something went wrong.."
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
