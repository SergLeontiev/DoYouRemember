//
//  NetworkClient.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import Combine
import Foundation

protocol NetworkClientLogic: AnyObject {
    func request<T>(type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, NetworkError> where T: Decodable
}

final class NetworkClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: NetworkClientLogic
extension NetworkClient: NetworkClientLogic {
    func request<T: Decodable>(type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, NetworkError> {
        guard let path = endpoint.path, let url = URL(string: path) else {
            let error = NetworkError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { result in
                self.decode(result.data)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Private Methods
private extension NetworkClient {
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
        let decoder = JSONDecoder()
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                    .parsing(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
