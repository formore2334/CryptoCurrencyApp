//
//  CoinsList.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import SwiftUI

struct CoinsList: View {
    @EnvironmentObject private var coinsViewModel: CoinsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("All Coins")
                .font(.headline)
                .padding(.vertical, 5)
                .padding(.horizontal)
            
            HStack {
                Text("Coins")
                
                Spacer()
                
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                
                ForEach(coinsViewModel.coins) { coin in
                    
                    CoinsRow(coin: coin)
                        .onAppear {
                            if coin.id == coinsViewModel.coins.last?.id {
                                coinsViewModel.loadData()
                            }
                        }
                    
                }
                
            }
            
        }
    }
}

struct CoinsList_Previews: PreviewProvider {
    static var previews: some View {
        CoinsList()
            .environmentObject(CoinsViewModel())
    }
}
