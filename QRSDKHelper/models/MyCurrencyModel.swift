//
//  MyCurrencyModel.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation

public struct MyCurrencyModel{
    public var symbol:String;
    public var code:String;
    public var numericCode:String;
    public static func SortAlphabetically(array:[MyCurrencyModel])->[MyCurrencyModel]{
        return array.sorted(by: { $0.code < $1.code })
    }
    public static func instance()->MyCurrencyModel{
        return MyCurrencyModel(symbol:"$", code:"USD", numericCode:"840");
    }
    public static func FindIndexByNumericCode(array:[MyCurrencyModel], currencyCode:String)->Int{
        return array.index(where: { $0.numericCode == currencyCode })!
    }
    public static func getCurrencySymbol(codeNumeric:String)->String{
        let csf=CurrencySymbolHelper();
        return csf.getCurrencySymbol(codeNumeric)
    }
}
