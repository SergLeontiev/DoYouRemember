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
    @Published private(set) var state = LoadingState<[WordDefinitionViewModel]>.idle
    
    init(networkClient: NetworkClientLogic = NetworkClient()) {
        self.networkClient = networkClient
        bind()
    }
}
private extension AddWordViewModel {
    func bind() {
        $word
            .dropFirst(1)
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .sink(receiveValue: fetchDefinitions(forWord:))
            .store(in: &disposables)
    }
    
    func fetchDefinitions(forWord word: String) {
        state = .loading

        networkClient.request(type: [DictionaryItem].self, endpoint: .getWordDefinitions(word: word))
            .map { response in
                response
                    .flatMap { $0.meanings}
                    .flatMap { $0.definitions }
                    .map(WordDefinitionViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .convertToLoadingState()
            .assign(to: &$state)
    }
}

struct Previews_AddWordViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
