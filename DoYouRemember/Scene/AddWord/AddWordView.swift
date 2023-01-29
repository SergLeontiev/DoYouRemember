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
        ScrollView {
            VStack(spacing: 20) {
                TextField("e.g. Amaze", text: $viewModel.word)
                
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    LoadingView()
                case let .failed(error):
                    ErrorView(error: error)
                case let .loaded(wordDefinions):
                    ForEach(wordDefinions, content: WordDefinitionRow.init(viewModel:))
                }
            }.padding(20)
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView(viewModel: AddWordViewModel())
    }
}
