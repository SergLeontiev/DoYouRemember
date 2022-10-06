//
//  DictionaryResponse.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import Foundation

struct DictionaryItem: Decodable {
    let word: String
    let meanings: [Meaning]
}

struct Meaning: Decodable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Decodable {
    let definition: String
    let example: String?
}
