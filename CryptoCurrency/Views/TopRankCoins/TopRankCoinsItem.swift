//
//  TopRankCoinsRow.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import SwiftUI

struct TopRankCoinsItem: View {
    var coin: Coin
    
    private var priceUp: Bool {
        coin.priceChangePercentage24H > 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: coin.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.orange)
            } placeholder: {
                 Circle()
                    .frame(width: 32, height: 32)
                    .background(Color(.systemGray3))
            }
            
            HStack {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
                
            Text("\(coin.priceChangePercentage24H.toPersentString())")
                .font(.title2)
                .foregroundColor(priceUp ? .green : .red)
            
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}



struct TopRankCoinsItem_Previews: PreviewProvider {
    static var previews: some View {
        TopRankCoinsItem(coin: Coin.sample)
    }
}
