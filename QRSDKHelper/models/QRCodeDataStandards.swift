//
//  QRCodeDataStandards.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MVisaQRParser;
import MPQRCoreSDK;

public class QRCodeDataStandard{
    public var transactionAmount:String?;
    public var convenienceFeeAmount:String?;
    public var convenienceFeePercentage:String?;
    public var mVisaMerchantID:String?;
    public var merchantCategoryCode:String?;
    public var currencyCode:String?;
    public var countryCode:String?;
    public var merchantName:String?;
    public var cityName:String?;
    public var postalCode:String?;
    public var consumerID:String?;
    public var billID:String?;
    public var mobileNumber:String?;
    public var storeID:String?;
    public var loyaltyNumber:String?;
    public var referenceID:String?;
    public var terminalID:String?;
    public var purpose:String?;
    public var additionalConsumerDataRequest:String?;
    public var tipAndFeeIndicator:String?;
    
    
    public init(ta:String?, cfa:String?, cfp:String?, mid:String?, mcc:String?, cc:String?, cCode:String?, mName:String?, cName:String?, pCode:String?, consID:String?, billID:String?, mobNumber:String?, sID:String?, lNumber:String?, rID:String?, termID:String?, purp:String?, addConsDataReq:String?, tfi:String?){
        self.transactionAmount=ta;
        self.convenienceFeeAmount=cfa;
        self.convenienceFeePercentage=cfp;
        self.mVisaMerchantID=mid;
        self.merchantCategoryCode=mcc;
        self.currencyCode=cc;
        self.countryCode=cCode;
        self.merchantName=mName;
        self.cityName=cName;
        self.postalCode=pCode;
        self.consumerID=consID;
        self.billID=billID;
        self.mobileNumber=mobNumber;
        self.storeID=sID;
        self.loyaltyNumber=lNumber;
        self.referenceID=rID;
        self.terminalID=termID;
        self.purpose=purp;
        self.additionalConsumerDataRequest=addConsDataReq;
        self.tipAndFeeIndicator=tfi;
    }
    public convenience init(qrData:QRCodeData){
        self.init(ta: qrData.transactionAmount, cfa: qrData.convenienceFeeAmount, cfp: qrData.convenienceFeePercentage, mid: qrData.mVisaMerchantID, mcc: qrData.merchantCategoryCode, cc: qrData.currencyCode, cCode: qrData.countryCode, mName: qrData.merchantName, cName: qrData.cityName, pCode: qrData.postalCode, consID: qrData.consumerID, billID: qrData.billID, mobNumber: qrData.mobileNumber, sID: qrData.storeID, lNumber: qrData.loyaltyNumber, rID: qrData.referenceID, termID: qrData.terminalID, purp: qrData.terminalID, addConsDataReq: qrData.additionalConsumerDataRequest, tfi: qrData.tipAndFeeIndicator)
    }
    public convenience init(qrData:PushPaymentData){
        self.init(ta: qrData.transactionAmount, cfa: qrData.valueOfConvenienceFeeFixed, cfp: qrData.valueOfConvenienceFeePercentage, mid: qrData.merchantIdentifierMastercard05, mcc: qrData.merchantCategoryCode, cc: qrData.transactionCurrencyCode, cCode: qrData.countryCode, mName: qrData.merchantName, cName: qrData.merchantCity, pCode: qrData.postalCode, consID: qrData.additionalData?.consumerId, billID: qrData.additionalData?.billNumber, mobNumber: qrData.additionalData?.mobileNumber, sID: qrData.additionalData?.storeId, lNumber: qrData.additionalData?.loyaltyNumber, rID: qrData.additionalData?.referenceId, termID: qrData.additionalData?.terminalId, purp: qrData.additionalData?.purpose, addConsDataReq: qrData.additionalData?.additionalConsumerDataRequest, tfi: qrData.tipOrConvenienceIndicator);
    }
    
    
    public func toBasePayment()->BasePayment{
        let p = BasePayment(      mvisaMerchantId: self.mVisaMerchantID,
                                  merchantCategoryCode: Int(self.merchantCategoryCode!),
                                  transactionCurrencyCode: self.currencyCode!,
                                  transactionAmount: self.transactionAmount,
                                  countryCode: self.countryCode!,
                                  merchantName: self.merchantName,
                                  merchantCity: self.cityName,
                                  transactionFeeAmount: self.transactionAmount,
                                  transactionFeePercentage: self.convenienceFeePercentage,
                                  convertedTransactionAmount: "0.0",
                                  conversionRate: "0.0",
                                  conversionCurrencyCode: nil,
                                  conversionMarkupRate: "0.0",
                                  convertedTransactionAmountBeforeMarkup: "0.0",
                                  postalCode: Int(self.postalCode!),
                                  consumerReferenceId: self.consumerID,
                                  billId: self.billID,
                                  mobileNumber: self.mobileNumber,
                                  storeId: self.storeID,
                                  loyaltyNumber: self.loyaltyNumber,
                                  referenceId: self.referenceID,
                                  consumerId: self.consumerID,
                                  terminalId: self.terminalID,
                                  purpose: self.purpose,
                                  dataRequest: self.additionalConsumerDataRequest)
        return p;
        
        
    }
    
}
