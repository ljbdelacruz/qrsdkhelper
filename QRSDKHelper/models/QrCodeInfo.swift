//
//  QrCodeInfo.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import ObjectMapper

public class QrCodeInfo: Mappable {
    
    public var transactionAmount: String?
    public var tipIncluded: String?
    public var tipConvenienceFee: String?
    public var tipPercentageFee: String?
    
    public var billNumber: String?
    public var mobileNumber: String?
    public var storeId: String?
    public var loyaltyNumber: String?
    public var referenceId: String?
    public var consumerId: String?
    public var terminalId: String?
    public var purpose: String?
    public var dataRequest: String?
    
    public var currencySymbol: String!
    
    public init() {
        
    }
    
    public init(transactionAmount: String? = nil,
                tipIncluded: String?,
                tipConvenienceFee: String? = nil,
                tipPercentageFee: String? = nil,
                billNumber: String? = nil,
                mobileNumber: String? = nil,
                storeId: String? = nil,
                loyaltyNumber: String? = nil,
                referenceId: String? = nil,
                consumerId: String? = nil,
                terminalId: String? = nil,
                purpose: String? = nil,
                dataRequest: String? = nil,
                currencySymbol: String) {
        
        self.transactionAmount = transactionAmount
        self.tipIncluded = tipIncluded
        self.tipConvenienceFee = tipConvenienceFee
        self.tipPercentageFee = tipPercentageFee
        self.billNumber = billNumber
        self.mobileNumber = mobileNumber
        self.storeId = storeId
        self.loyaltyNumber = loyaltyNumber
        self.referenceId = referenceId
        self.consumerId = consumerId
        self.terminalId = terminalId
        self.purpose = purpose
        self.dataRequest = dataRequest
        self.currencySymbol = currencySymbol
        
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.transactionAmount <- map["transactionAmount"]
        self.tipIncluded <- map["tipIncluded"]
        self.tipConvenienceFee <- map["tipConvenienceFee"]
        self.tipPercentageFee <- map["tipPercentageFee"]
        self.billNumber <- map["billNumber"]
        self.mobileNumber <- map["mobileNumber"]
        self.storeId <- map["storeId"]
        self.loyaltyNumber <- map["loyaltyNumber"]
        self.referenceId <- map["referenceId"]
        self.consumerId <- map["consumerId"]
        self.terminalId <- map["terminalId"]
        self.purpose <- map["purpose"]
        self.dataRequest <- map["dataRequest"]
        self.currencySymbol <- map["currencySymbol"]
    }
    
}
