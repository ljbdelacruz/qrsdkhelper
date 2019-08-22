//
//  Double+.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation

public extension Double {
    public func currencyFormat(symbol: String = "", roundUp: Bool = false) -> String {
        let formatter = NumberFormatter()
        
        formatter.currencySymbol = symbol
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = roundUp ? .halfUp : .down
        
        let formattedNumber = formatter.string(from: NSNumber(value: self))
        
        guard formattedNumber != nil else { fatalError("Unable to format string.") }
        return formattedNumber!
    }
    
}
