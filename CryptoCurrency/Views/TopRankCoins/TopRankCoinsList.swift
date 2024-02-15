//
//  TopRankCoinsList.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import SwiftUI

struct TopRankCoinsList: View {
    @EnvironmentObject private var coinsViewModel: CoinsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Top Movers")
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    
                    ForEach(coinsViewModel.coins.prefix(5)) { coin in
                            TopRankCoinsItem(coin: coin)
                    }
                    
                }
                
            }
            
        }
        .padding()
    }
}

struct TopRankCoinsList_Previews: PreviewProvider {
    static var previews: some View {
        TopRankCoinsList()
            .environmentObject(CoinsViewModel())
    }
}
