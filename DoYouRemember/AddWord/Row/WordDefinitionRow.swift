//
//  WordDefinitionRow.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import SwiftUI

struct WordDefinitionRow: View {
    private let viewModel: WordDefinitionViewModel
    
    init(viewModel: WordDefinitionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.definition.definition)
                .bold()
            Text(viewModel.definition.example ?? "No example")
        }
    }
}

struct WordDefinitionRow_Previews: PreviewProvider {
    static var previews: some View {
        let definition = Definition(definition: "definition", example: "example")
        let viewModel = WordDefinitionViewModel(definition: definition)
        WordDefinitionRow(viewModel: viewModel)
    }
}
