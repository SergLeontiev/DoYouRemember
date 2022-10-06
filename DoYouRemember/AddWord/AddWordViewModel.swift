//
//  AddWordViewModel.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//


import SwiftUI
import Combine

class AddWordViewModel: ObservableObject {
    private let networkClient: NetworkClientLogic
    private var disposables = Set<AnyCancellable>()
    
    @Published var word: String = ""
    @Published var dataSource: [WordDefinitionViewModel] = []
    
    init(networkClient: NetworkClientLogic = NetworkClient()) {
        self.networkClient = networkClient
        bind()
    }
}
private extension AddWordViewModel {
    func bind() {
        $word
          .dropFirst(1)
          .filter { !$0.isEmpty }
          .debounce(for: .seconds(0.5), scheduler: DispatchQueue(label: "AddWordViewModel"))
          .sink(receiveValue: fetchDefinitions(forWord:))
          .store(in: &disposables)
    }
    
    func fetchDefinitions(forWord word: String) {
        networkClient.getDictionaryItem(text: word)
            .map { response in
                response
                    .flatMap { $0.meanings}
                    .flatMap { $0.definitions }
                    .map(WordDefinitionViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    if case .failure = value {
                        self?.dataSource = []
                    }
                }, receiveValue: { [weak self] viewModels in
                    self?.dataSource = viewModels
                })
            .store(in: &disposables)
    }
}
