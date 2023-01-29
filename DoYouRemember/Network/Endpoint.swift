//
//  Endpoint.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 28.01.2023.
//

import Foundation

enum Endpoint {
    case getWordDefinitions(word: String)
    
    var path: String? {
        switch self {
        case let .getWordDefinitions(word):
            return "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }
    }
}
