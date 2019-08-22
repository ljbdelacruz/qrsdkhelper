//
//  QRParseResultModel.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MVisaQRParser

public class QRParseResultVM {
    public enum Tip {
        case none
        case optional
        case flat(value: Double)
        case percentage(value: Double)
    }
    public var data: QRParseResult
    // FIXME: - Instead of relying on raw data and this view model, replace it with something cleaner.
    public var rawData: QRCodeData
    public var additionalFields:[AdditionalFieldModel]=[];
    
    //    private var _additionalFieldViews: [AdditionalFieldView] = [AdditionalFieldView]()
    //    // FIXME: - Replace textfield underline
    //    private var textFieldUnderlines: [TextFieldUnderline] = [TextFieldUnderline]()
    public init(qrCodeData: QRCodeData) {
        rawData = qrCodeData
        data = QRParseResult(qrCodeData: qrCodeData)
        checkForAdditionalFields(data: qrCodeData)
    }
    public func merchantId() -> String {
        return data.merchantId!
    }
    
    public func merchantName() -> String {
        return data.merchantName!
    }
    
    public func paymentAmount() -> String? {
        guard let paymentAmount = data.paymentAmount else {
            return ""
        }
        return paymentAmount
    }
    public func tip() -> Tip {
        let amount = data.tipAmount
        let percentage = data.tipPercentage
        guard let indicator = data.tipIndicator else {
            return .none
        }
        switch indicator {
        case "01":
            return .optional
        case "02":
            return .flat(value: Double(amount!)!)
        case "03":
            return .percentage(value: Double(percentage!)!)
        default:
            break
        }
        return .none
    }
    // MARK: Additional fields management
    public func checkForAdditionalFields(data: QRCodeData) {
        if let additionalDataField = data.additionalDataFieldTemplate {
            for (key, _) in additionalDataField {
                self.additionalFields.append(AdditionalFieldModel(fieldName: camelCaseToFieldName(s: key), value: ""));
            }
        }
    }
    public func camelCaseToFieldName(s: String) -> String{
        let words = s.camelCaseToWords()
        let first = String(words.characters.prefix(1)).capitalized
        let others = String(words.characters.dropFirst())
        return ((first+others).replacingOccurrences(of: "I D", with: "ID"))
    }
    public func getRawData() -> QRCodeData {
        return rawData
    }
}
