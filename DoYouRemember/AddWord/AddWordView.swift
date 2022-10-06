//
//  AddWordView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import SwiftUI

struct AddWordView: View {
    @ObservedObject var viewModel: AddWordViewModel

    init(viewModel: AddWordViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            TextField("e.g. Amaze", text: $viewModel.word)
            
            Section {
                ForEach(viewModel.dataSource,
                        content: WordDefinitionRow.init(viewModel:))
            }
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView(viewModel: AddWordViewModel())
    }
}
