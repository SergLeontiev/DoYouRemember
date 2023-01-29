//
//  NetworkError.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import Foundation

enum NetworkError: LocalizedError {
    case parsing(description: String)
    case network(description: String)
    
    var errorDescription: String? {
        switch self {
        case let .network(description), let .parsing(description):
            return description
        }
    }
}
