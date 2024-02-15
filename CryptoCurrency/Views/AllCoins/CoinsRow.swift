//
//  CoinsRow.swift
//  CryptoCurrency
//
//  Created by ForMore on 21/09/2023.
//

import SwiftUI

struct CoinsRow: View {
    var coin: Coin
    
    var priceUp: Bool {
        coin.priceChangePercentage24H > 0
    }
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
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
            
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("\(coin.priceChangePercentage24H.toPersentString())")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(priceUp ? .green : .red)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct CoinsRow_Previews: PreviewProvider {
    static var previews: some View {
        CoinsRow(coin: Coin.sample)
    }
}
