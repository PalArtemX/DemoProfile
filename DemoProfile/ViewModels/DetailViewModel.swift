//
//  DetailViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    
    var cancellable = Set<AnyCancellable>()
    let dataServices: DataServiceProtocol
    
    private let urlDetailAPI = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
    
    @Published private(set) var detail = Detail(name: "", description: "", rating: 0.0, numberOfReviews: 0, price: 0, colors: [], imageUrls: [])
    
    init(dataServices: DataServiceProtocol) {
        self.dataServices = dataServices
        getDetail()
    }
}


// MARK: - Detail View
extension DetailViewModel {
    
    private func getDetail() {
        guard let url = URL(string: urlDetailAPI) else { return }
        
        dataServices.download(url: url)
            .decode(type: Detail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion) { [weak self] returnedDetail in
                self?.detail = returnedDetail
            }
            .store(in: &cancellable)
    }
}
