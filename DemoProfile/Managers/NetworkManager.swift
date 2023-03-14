//
//  NetworkManager.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import Foundation
import Combine

class NetworkManager: DataServiceProtocol {
    
    // MARK: - NetworkError
    private enum NetworkError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
               return "[⚠️] Bad response from URL: \(url)"
            case .unknown:
               return "[⚠️] Unknown error"
            }
        }
    }
    
    // MARK: - download
    func download(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ try self.handleURLResponse(output: $0, url: url )})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // MARK: - handleURLResponse
    func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.badURLResponse(url: url)
        }
        return output.data
    }
    
    // MARK: - handleCompletion
    func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            print("[✅] Completion finished")
        case .failure(let error):
            print("[⚠️] Error \(error.localizedDescription)")
        }
    }
}
