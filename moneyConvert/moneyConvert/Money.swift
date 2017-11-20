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
            case .KRW : return "W"
            case .JPY : return "Y"
            case .EUR : return "E"
            }
        }
    }
    
//    func symbolStr() -> String {
//        switch self {
//        case .USD : return "$"
//        case .KRW : return "W"
//        case .JPY : return "Y"
//        case .EUR : return "E"
//        }
//    }
}

struct Money {
    var moneyInput: Double = 0.0
    
    init(_ moneyInput: Double) {
        self.moneyInput = moneyInput
    }

    init(_ amount: Double, currency: Currency) {
        self.moneyInput = amount / currency.ratio
    }
    
//    func example() {
//        let c1: Currency = .JPY
//
//        let sy1 = c1.symbol
//        let sy2 = c1.symbolStr()
//
//        if sy1 == sy2 {
//            print("SAME!!")
//        }
    
    
    func valueInCurrency(currency: Currency) -> String { // 화폐종류 받아서 [화폐 심볼 + 금액*ratio] 계산 하여 리턴
        return "\(currency.symbol)" + "\(moneyInput * currency.ratio)"
    }
    
}

//let myMoney: Money = Money(120)
//let myMoneyWon: Money = Money(350_000, currency: .KRW)



