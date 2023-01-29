//
//  WordDefinitionViewModel.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import Foundation

struct WordDefinitionViewModel: Identifiable {
    private(set) var definition: Definition
    
    var id: String {
        return definition.definition + (definition.example ?? "")
    }
    
    init(definition: Definition) {
        self.definition = definition
    }
}
