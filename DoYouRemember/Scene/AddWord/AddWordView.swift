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
            searchView
            
            switch viewModel.state {
            case .idle:
                Spacer()
                HStack {
                    Image("girlChattingWithFriends")
                        .padding(.leading, -30)
                    Spacer()
                }
            case .loading:
                Spacer()
                LoadingView()
                Spacer()
            case let .failed(error):
                Spacer()
                ErrorView(error: error)
                    .padding()
                Spacer()
            case let .loaded(wordDefinions):
                if !wordDefinions.isEmpty {
                    WordsView(wordDefinions: wordDefinions)
                } else {
                    Spacer()
                    VStack(spacing: 25) {
                        Image("man")
                        Text("Sorry, we couldn’t find anything")
                            .font(.system(size: 13, weight: .regular))
                    }
                    Spacer()
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

// MARK: - Private Methods
extension AddWordView {
    private var searchView: some View {
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
    }
    
    struct WordsView: View {
        var wordDefinions: [WordDefinitionViewModel] = []
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("Select translation")
                    Spacer()
                }
                .padding(.leading, 18)
                
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
