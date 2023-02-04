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
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.definition.definition)
                    .font(.system(size: 17, weight: .regular))
                Text(viewModel.definition.example ?? "No example")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
    }
}

struct WordDefinitionRow_Previews: PreviewProvider {
    static var previews: some View {
        let definition = Definition(definition: "definition", example: "example")
        let viewModel = WordDefinitionViewModel(definition: definition)
        WordDefinitionRow(viewModel: viewModel)
    }
}
