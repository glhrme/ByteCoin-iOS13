//
//  CoinDataModel.swift
//  ByteCoin
//
//  Created by Guilherme de Assis dos Santos on 14/06/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

struct Coin {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
