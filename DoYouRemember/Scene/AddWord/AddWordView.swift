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
        VStack(spacing: 36) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Word or phrase")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
                TextField("e.g. take after", text: $viewModel.word)
                    .padding(12)
                    .frame(height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)))
                    )
                    
            }
            .padding(.top, 25)
            .padding(.horizontal, 18)
            
            switch viewModel.state {
            case .idle:
                Spacer()
            case .loading:
                Spacer()
                LoadingView()
                Spacer()
            case let .failed(error):
                Spacer()
                ErrorView(error: error)
                Spacer()
            case let .loaded(wordDefinions):
                ScrollView {
                    ForEach(wordDefinions) {
                        WordDefinitionRow(viewModel: $0)
                        Divider()
                    }
                }
            }
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView(viewModel: AddWordViewModel())
    }
}
