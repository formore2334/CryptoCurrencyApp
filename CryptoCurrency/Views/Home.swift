//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var coinsViewModel: CoinsViewModel
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                TopRankCoinsList()
                
                Divider()
                
                CoinsList()
            }
            .navigationTitle("Current Prices")
            
        }
        .onReceive(coinsViewModel.$error, perform: { error in
            
            if error != nil {
                showAlert.toggle()
            }
            
        })
        .refreshable {
           await coinsViewModel.handleRefresh()
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(CoinsViewModel())
    }
}
