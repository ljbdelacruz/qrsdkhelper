//
//  QRParseResult.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MVisaQRParser

public class QRParseResult {
    // MARK: Common
    public var payloadFormatIndicator: String?
    public var merchantId: String?
    public var merchantCategoryCode: String?
    public var transactionCurrencyCode: String?
    public var countryCode: String?
    public var merchantName: String?
    public var merchantCity: String?
    public var crc: String?
    // MARK: Other Cases
    public var pointOfInitiation: String?
    public var paymentAmount: String?
    // MARK: Tip
    public var tipIndicator: String?
    public var tipAmount: String?
    public var tipPercentage: String?
    // MARK: Raw
    public var rawData: QRCodeData!
    
    public init(qrCodeData: QRCodeData!) {
        // Common
        payloadFormatIndicator = qrCodeData.payloadFormatIndicator
        merchantId = qrCodeData.mVisaMerchantID
        merchantCategoryCode = qrCodeData.merchantCategoryCode
        transactionCurrencyCode = qrCodeData.currencyCode
        countryCode = qrCodeData.countryCode
        merchantName = qrCodeData.merchantName
        merchantCity = qrCodeData.cityName
        crc = qrCodeData.crc
        // Transaction Amount:
        paymentAmount = qrCodeData.transactionAmount
        // Tip
        tipIndicator = qrCodeData.tipAndFeeIndicator
        tipAmount = qrCodeData.convenienceFeeAmount
        tipPercentage = qrCodeData.convenienceFeePercentage
        
        // Raw Data:
        rawData = qrCodeData
    }
    
}
