//
//  PublisherExstension.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 28.01.2023.
//

import Combine

extension Publisher {
    func convertToResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        map(Result.success)
            .catch { Just(.failure($0)) }
            .eraseToAnyPublisher()
    }
    
    func convertToLoadingState() -> AnyPublisher<LoadingState<Output>, Never> {
        map(LoadingState.loaded)
            .catch { Just(.failed($0)) }
            .eraseToAnyPublisher()
    }
}
