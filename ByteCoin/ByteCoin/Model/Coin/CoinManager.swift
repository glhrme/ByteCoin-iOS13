//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "049EA351-C379-4792-8327-A944951A04A3"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetch(currency: String, delegate: ByteCoinViewModelDelegate) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                
                guard let safeData = data else { return }
                guard let coin = self.parseJSON(coinData: safeData) else { return }
                delegate.updateView(coin)
            }
            
            task.resume()
        }
    }
    
    private func parseJSON(coinData: Data) -> Coin? {
        let decoder = JSONDecoder()
        
        do {
            let data = try decoder.decode(CoinData.self, from: coinData)
            return Coin(asset_id_base: data.asset_id_base, asset_id_quote: data.asset_id_quote, rate: data.rate)
        } catch {
            return nil
        }
    }
    
    
    
}
