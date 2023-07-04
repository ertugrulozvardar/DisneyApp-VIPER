//
//  Network.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

struct Network {
    
    private let urlSession = URLSession.shared
    
    func performRequest<T: Codable>(request: Requestable, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = urlSession.dataTask(with: request.convertToURLRequest()) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(model))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                } else if error != nil {
                    completion(.failure(.networkError))
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case decodingError
    case networkError
    case unknownError
    case invalidUrlError
}

