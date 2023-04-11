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
            searchView()
            
            switch viewModel.state {
            case .idle:
                idleView()
            case .loading:
                loadingView()
            case let .failed(error):
                errorView(error: error)
            case let .loaded(wordDefinitions):
                wordsView(wordDefinitions: wordDefinitions)
            }
        }
    }
}

// MARK: - Private
private extension AddWordView {
    func searchView() -> some View {
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
    
    func idleView() -> some View {
        Group {
            Spacer()
            HStack {
                Image("girlChattingWithFriends")
                    .padding(.leading, -30)
                Spacer()
            }
        }
    }
    
    func loadingView() -> some View {
        Group {
            Spacer()
            LoadingView()
            Spacer()
        }
    }
    
    func errorView(error: Error) -> some View {
        Group {
            Spacer()
            ErrorView(error: error)
                .padding()
            Spacer()
        }
    }
    
    func wordsView(wordDefinitions: [WordDefinitionViewModel]) -> some View {
        Group {
            if !wordDefinitions.isEmpty {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Select translation")
                        Spacer()
                    }
                    .padding(.leading, 18)
                    
                    ScrollView {
                        ForEach(wordDefinitions) {
                            WordDefinitionRow(viewModel: $0)
                            Divider()
                        }
                    }
                }
            } else {
                VStack(spacing: 25) {
                    Image("man")
                    Text("Sorry, we couldn’t find anything")
                        .font(.system(size: 13, weight: .regular))
                }
                .frame(maxHeight: .infinity)
            }
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView(viewModel: AddWordViewModel())
    }
}
