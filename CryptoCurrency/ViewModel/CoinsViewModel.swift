//
//  CoinsViewModel.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import Foundation


@MainActor
class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var error: Error?
    
    private let pageLimit: Int = 20
    private var page: Int = 0
    
    var urlString: String {
        return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(pageLimit)&page=\(page)&sparkline=true&price_change_percentage=24h&locale=en"
    }
    init() {
        loadData()
    }
    
    // Triggered when user refresh the page
    func handleRefresh() async {
        try? await Task.sleep(for: .seconds(1))
        
        // Clears the array
        coins.removeAll()
        
        // Returns current page on zero
        page = 0
        
        // Loads data again
        loadData()
    }
    
}

extension CoinsViewModel {
    
    // Called upon initialization and when the user scrolls down the list
    // Only on main thread
    @MainActor
    private func downloadCoinsAsync() async throws {
        guard let url = URL(string: urlString) else { throw CoinError.invalidURL }
        do {
            
            // Each time the user scroll down, the counter increases and the current page is displayed on the
            self.page += 1
            
            // Receives data & decode it
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CoinError.serverError}
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { throw CoinError.invalidData }
            
            self.coins.append(contentsOf: coins)
        } catch {
            self.error = error
        }
    }
    
    // Calls downloadCoinsAsync
    func loadData() {
        Task(priority: .medium) {
           try await downloadCoinsAsync()
        }
    }
    
}



