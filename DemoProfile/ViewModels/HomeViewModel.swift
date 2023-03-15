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
    
    // API
    private let urlLatestAPI = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let urlFlashSaleAPI = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    private let urlSearchAPI = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
    
    @Published private(set) var brands = PreviewContent.brands
    @Published private(set) var icons: [Resources.HomeIcon] = [
        .phones, .headPhones, .games, .cars, .furniture, .kids
    ]
   
    // data carousels
    @Published private(set) var latest = Latest(elements: [])
    @Published private(set) var flashSale = FlashSale(elements: [])
    
    @Published private(set) var allDataUploaded = false
    
    // search
    @Published var isShowSearch = false
    @Published var searchField = "" {
        didSet {
            if searchField.isEmpty {
                isShowSearch = false
            } else {
                isShowSearch = true
            }
        }
    }
    @Published var resultSearch: [String] = []
    @Published private(set) var wordSearch = Word(words: [])
    

    init(dataServices: DataServiceProtocol) {
        self.dataServices = dataServices
        checkingLoadingAllData()
        loadingData()
        searchText()
    }
}



// MARK: - Load data
extension HomeViewModel {
    
    func loadingData() {
        getFlashSale()
        getLatest()
    }
    
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
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
                    self?.allDataUploaded = allDataUploaded
                }
            }
            .store(in: &cancellable)
    }
    
    private func getLatest() {
        guard let url = URL(string: urlLatestAPI) else { return } 
        
        dataServices.download(url: url)
            .decode(type: Latest.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion) { [weak self] returnedLatests in
                self?.latest = returnedLatests
            }
            .store(in: &cancellable)
    }
    
    private func getFlashSale() {
        guard let url = URL(string: urlFlashSaleAPI) else { return }
        
        dataServices.download(url: url)
            .decode(type: FlashSale.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion) { [weak self] returnedFlashSale in
                self?.flashSale = returnedFlashSale
            }
            .store(in: &cancellable)
    }
}



// MARK: Search
extension HomeViewModel {
    
    private func getWords() {
        guard let url = URL(string: urlSearchAPI) else { return }
        
        dataServices.download(url: url)
            .decode(type: Word.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataServices.handleCompletion) { [weak self] returnedWord in
                self?.wordSearch = returnedWord
            }
            .store(in: &cancellable)
    }
    
    private func searchText() {
        $searchField
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { (string) -> String in
                if string.count < 1 {
                    self.resultSearch = []
                }
                return string
            }
            .sink { [weak self] searchField in
                self?.getWords()
                self?.resultSearch = self?.wordSearch.words.filter { item in
                    return item.lowercased().contains(searchField.lowercased())
                } ?? []
            }
            .store(in: &cancellable)
    }
}
