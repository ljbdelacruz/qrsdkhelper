//
//  BasePaymentModel.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol PaymentModel {
    func toJSON() -> [String: Any]
}
public class BasePayment: Mappable, PaymentModel {
    // Required
    public var transactionDateTime: String!
    public var mvisaMerchantId: String!
    public var accountNumberLastFour: String!
    public var accountType: Int!
    public var accountId: Int!
    public var merchantCategoryCode: Int!
    public var transactionCurrencyCode: String!
    public var transactionAmount: String!
    public var countryCode: String!
    public var merchantName: String!
    public var merchantCity: String!
    // Optional
    public var transactionFeeAmount: String?
    public var transactionFeePercentage: String?
    public var convertedTransactionAmount: String?
    
    public var conversionRate: String?
    public var conversionCurrencyCode: String?
    public var conversionMarkupRate: String?
    public var convertedTransactionAmountBeforeMarkup: String?
    
    public var postalCode: Int?
    public var consumerReferenceId: String?
    
    // Additonal Fields
    public var billId: String?
    public var mobileNumber: String?
    public var storeId: String?
    public var loyaltyNumber: String?
    public var referenceId: String?
    public var consumerId: String?
    public var terminalId: String?
    public var purpose: String?
    public var dataRequest: String?
    
    // Security
    public var verificationToken: String?
    public var biometricAuthorized: Bool?
    
    public init() {
    }
    
    // MARK: - Initializer for QR Code
    public init(mvisaMerchantId: String!,
                merchantCategoryCode: Int!,
                transactionCurrencyCode: String!,
                transactionAmount: String? = "0",
                countryCode: String!,
                merchantName: String!,
                merchantCity: String!,
                transactionFeeAmount: String? = "",
                transactionFeePercentage: String? = "",
                convertedTransactionAmount: String?,
                conversionRate: String?,
                conversionCurrencyCode: String?,
                conversionMarkupRate: String?,
                convertedTransactionAmountBeforeMarkup: String?,
                postalCode: Int? = 0,
                consumerReferenceId: String? = nil,
                billId: String?,
                mobileNumber: String?,
                storeId: String?,
                loyaltyNumber: String?,
                referenceId: String?,
                consumerId: String?,
                terminalId: String?,
                purpose: String?,
                dataRequest: String?) {
        self.mvisaMerchantId = mvisaMerchantId
        self.merchantCategoryCode = merchantCategoryCode
        self.transactionCurrencyCode = transactionCurrencyCode
        self.transactionAmount = transactionAmount
        self.countryCode = countryCode
        self.merchantName = merchantName
        self.merchantCity = merchantCity
        self.transactionFeeAmount = transactionFeeAmount
        self.transactionFeePercentage = transactionFeePercentage
        self.convertedTransactionAmount = convertedTransactionAmount
        self.conversionRate = conversionRate
        self.conversionCurrencyCode = conversionCurrencyCode
        self.conversionMarkupRate = conversionMarkupRate
        self.convertedTransactionAmountBeforeMarkup = convertedTransactionAmountBeforeMarkup
        self.postalCode = postalCode
        self.consumerReferenceId = consumerReferenceId
        self.billId = billId
        self.mobileNumber = mobileNumber
        self.storeId = storeId
        self.loyaltyNumber = loyaltyNumber
        self.referenceId = referenceId
        self.consumerId = consumerId
        self.terminalId = terminalId
        self.purpose = purpose
        self.dataRequest = dataRequest
        
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        transactionDateTime <- map["transactionDateTime"]
        mvisaMerchantId <- map["mvisaMerchantId"]
        accountNumberLastFour <- map["accountNumberLastFour"]
        accountType <- map["accountType"]
        accountId <- map["accountId"]
        merchantCategoryCode <- map["merchantCategoryCode"]
        transactionCurrencyCode <- map["transactionCurrencyCode"]
        transactionAmount <- map["transactionAmount"]
        countryCode <- map["countryCode"]
        merchantName <- map["merchantName"]
        merchantCity <- map["merchantCity"]
        transactionFeeAmount <- map["transactionFeeAmount"]
        transactionFeePercentage <- map["transactionFeePercentage"]
        convertedTransactionAmount <- map["convertedTransactionAmount"]
        conversionRate <- map["conversionRate"]
        conversionCurrencyCode <- map["conversionCurrencyCode"]
        conversionMarkupRate <- map["conversionMarkupRate"]
        convertedTransactionAmountBeforeMarkup <- map["convertedTransactionAmountBeforeMarkup"]
        postalCode <- map["postalCode"]
        consumerReferenceId <- map["consumerReferenceId"]
        verificationToken <- map["verificationToken"]
        biometricAuthorized <- map["biometricAuthorized"]
        billId <- map["billId"]
        mobileNumber <- map["mobileNumber"]
        storeId <- map["storeId"]
        loyaltyNumber <- map["loyaltyNumber"]
        referenceId <- map["referenceId"]
        consumerId <- map["consumerId"]
        terminalId <- map["terminalId"]
        purpose <- map["purpose"]
        dataRequest <- map["additionalConsumerDataRequest"]
    }
    
}
