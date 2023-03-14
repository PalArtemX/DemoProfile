//
//  HomeViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    var cancellable = Set<AnyCancellable>()
    let dataServices: DataServiceProtocol
    
    private let urlLatestAPI = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let urlFlashSaleAPI = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    
    @Published private(set) var icons: [Resources.HomeIcon] = [.phones, .headPhones, .games, .cars, .furniture, .kids]
    @Published private(set) var brands = PreviewContent.brands
    
    @Published private(set) var latest = Latest(elements: [])
    @Published private(set) var flashSale = FlashSale(elements: [])
    
    @Published private(set) var allDataUploaded = false
    
   
    init(dataServices: DataServiceProtocol) {
        self.dataServices = dataServices
        checkingLoadingAllData()
        getLatest()
        getFlashSale()
    }
}


// MARK: - Load data
extension HomeViewModel {
    
    private func checkingLoadingAllData() {
        $latest
            .combineLatest($flashSale)
            .map { (latest, flashSale) -> Bool in
                if !latest.elements.isEmpty && !flashSale.elements.isEmpty {
                    return true
                } else {
                    return false
                }
            }
            .eraseToAnyPublisher()
            .sink { [weak self] allDataUploaded in
                self?.allDataUploaded = allDataUploaded
            }
            .store(in: &cancellable)
    }
    
    private func getLatest() {
        guard let url = URL(string: urlLatestAPI) else { return } 
        
        dataServices.download(url: url)
            .decode(type: Latest.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion, receiveValue: { [weak self] returnedLatests in
                self?.latest = returnedLatests
            })
            .store(in: &cancellable)
    }
    
    private func getFlashSale() {
        guard let url = URL(string: urlFlashSaleAPI) else { return }
        
        dataServices.download(url: url)
            .decode(type: FlashSale.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion, receiveValue: { [weak self] returnedFlashSale in
                self?.flashSale = returnedFlashSale
            })
            .store(in: &cancellable)
    }

}



