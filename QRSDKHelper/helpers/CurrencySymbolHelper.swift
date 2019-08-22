//
//  CurrencySymbolHelper.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation

public class CurrencySymbolHelper {
    public static let instance = CurrencySymbolHelper()
    private let reference: NSDictionary = {
        let path = Bundle.main.url(forResource: "ISO-4217", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: path)
        return dict!
    }()
    public var localeArray: [Locale]!
    public var symbolList: [MyCurrencyModel]=[]
    public init(){
        localeArray = Locale.availableIdentifiers.map({ Locale.init(identifier: $0) })
    }
    public func getAlphaCode(fromNumericCode numericCode: String) -> String {
        return self.reference[numericCode] as! String
    }
    public func getCurrencySymbol(_ numericCode: String) -> String {
        let l = localeArray.first(where: { $0.currencyCode == getAlphaCode(fromNumericCode: numericCode) })
        if l != nil{
            return l!.currencySymbol ?? ""
        }
        return "";
    }
    public func getCurrencySymbols()->[MyCurrencyModel]{
        if self.symbolList.count <= 0{
            self.reference.forEach({ (key, value) in
                self.symbolList.append(MyCurrencyModel(symbol: self.getCurrencySymbol(key as! String), code: value as! String, numericCode: key as! String))
            })
        }
        return self.symbolList;
    }
}


