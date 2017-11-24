//
//  Money.swift
//  moneyConvert
//
//  Created by 김은진 on 08/11/2017.
//  Copyright © 2017 BlissBless. All rights reserved.
//

import Foundation

enum Currency: Int {
    case USD = 0
    case KRW = 1
    case JPY = 2
    case EUR = 3
    
    var ratio: Double {
        get {
            switch self {
            case .USD : return 1.0
            case .KRW : return 1178.5
            case .JPY : return 122.45
            case .EUR : return 0.92
            }
        }
    }
    
    var symbol: String {
        get {
            switch self {
            case .USD : return "$"
            case .KRW : return "￦"
            case .JPY : return "￥"
            case .EUR : return "€"
            }
        }
    }
    
    var currencyStr: String {
        get {
            switch self {
            case .USD:
                return "US Dollar"
            case .KRW:
                return "South Korean Won"
            case .JPY:
                return "Japanese Yen"
            case .EUR:
                return "Euro"
            }
        }
    }
    
}

struct Money {
    private var moneyInput: Double = 0.0
    
    init(_ moneyInput: Double) {
        self.moneyInput = moneyInput
    }

    init(_ amount: Double, currency: Currency) {
        self.moneyInput = amount / currency.ratio
    }
    
    func valueInCurrency(currency: Currency) -> String {
        return "\(currency.symbol)" + "\(moneyInput * currency.ratio)"
    }
    
    func explainString(moneyText: String, currency: Currency) -> String {
        return "\(moneyText) " + "\(currency.currencyStr)" + " equals"

    }
}




