//
//  ByteCoinViewModel.swift
//  ByteCoin
//
//  Created by Guilherme de Assis dos Santos on 14/06/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

protocol ByteCoinViewModelDelegate {
    func updateView(_ coin: Coin) -> Void
}

class ByteCoinViewModel {
    var delegate: ByteCoinViewModelDelegate?
    
    func getCurrency(_ currency: String) {
        if delegate != nil {
            CoinManager().fetch(currency: currency, delegate: self.delegate!)
        }
    }
}
