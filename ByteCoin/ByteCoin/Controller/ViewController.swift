//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayValueLabel: UILabel!
    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var pickerViewCurrency: UIPickerView!
    
    let coinManager = CoinManager()
    let vm = ByteCoinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        pickerViewCurrency.delegate = self
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        self.vm.getCurrency(selectedCurrency)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.coinManager.currencyArray[row]
    }
}

extension ViewController: ByteCoinViewModelDelegate {
    func updateView(_ coin: Coin) {
        DispatchQueue.main.sync {
            //UPDATE VIEW
            self.displayValueLabel.text = "\(coin.rateString)"
            self.currencylabel.text = coin.asset_id_quote
        }
    }
}

