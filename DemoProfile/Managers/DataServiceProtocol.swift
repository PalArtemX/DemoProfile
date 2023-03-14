//
//  DataServiceProtocol.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import Foundation
import Combine

protocol DataServiceProtocol {
    
    func download(url: URL) -> AnyPublisher<Data, Error>
    
    func handleCompletion(completion: Subscribers.Completion<Error>)
    
}
