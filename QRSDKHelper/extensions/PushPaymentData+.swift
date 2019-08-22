//
//  PushPaymentData+.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MPQRCoreSDK

public extension PushPaymentData{
    //how to generate QR Code is push payment data
    public func generateQRCode() -> UIImage? {
        let data = try! self.generatePushPaymentString().data(using: String.Encoding.utf8);
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            // Set scale according to your device display. If the qr code is blurry then increase scale
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }

    public func setupTipType(type:TipConvenienceIndicator, percentage:String, fixed:String){
        switch type {
        case .promptedToEnterTip:
            // Tip or convenience indicator
            self.tipOrConvenienceIndicator = "01"
        case .flatConvenienceFee:
            // Tip or convenience indicator
            self.tipOrConvenienceIndicator = "02"
            // Value of convenience fee fixed
            self.valueOfConvenienceFeeFixed = fixed
        case .percentageConvenienceFee:
            // Tip or convenience indicator
            self.tipOrConvenienceIndicator = "03"
            // Value of convenience fee percentage
            self.valueOfConvenienceFeePercentage = percentage
        case .unknownTipConvenienceIndicator:
            print("do nothing")
        }
    }
    public func setMerchantData(cCode:String, name:String, mCity:String, pCode:String, c:String, merCatCode:String, transCurrCode:String, amt:String){
        self.countryCode=cCode;
        self.merchantName=name;
        self.merchantCity=mCity;
        self.postalCode=pCode;
        self.crc=c;
        self.merchantCategoryCode=merCatCode;
        self.transactionCurrencyCode=transCurrCode;
        self.transactionAmount=amt;
    }
    public func setLanguageData(lPref:String, aMerCity:String, aMerName:String){
        self.languageData?.languagePreference=lPref;
        self.languageData?.alternateMerchantCity=aMerCity;
        self.languageData?.alternateMerchantName=aMerName;
    }
    public func setAddOnData(sid:String, loyalNum:String, termID:String, addOnConsData:String){
        self.additionalData?.storeId=sid;
        self.additionalData?.loyaltyNumber=loyalNum;
        self.additionalData?.terminalId=termID;
        self.additionalData?.additionalConsumerDataRequest=addOnConsData;
    }
    public func setupAddonUnrestrictedData(rSubTag:String, aid:String, cont:String, contTag:String, dynCont:String, contSpecTag:String, tagging:Int){
        let rootSubTag = rSubTag;
        let additionalUnrestrictedData = UnrestrictedData()
        additionalUnrestrictedData.setRootTag(rootSubTag)
        additionalUnrestrictedData.AID = aid
        try! additionalUnrestrictedData.setContextSpecific(cont, forTag: contTag)
        try! additionalUnrestrictedData.setDynamicContextSpecific(dynCont)
        let str01 = try!additionalUnrestrictedData.getContextSpecificData(forTag: contSpecTag)
        let arr = additionalUnrestrictedData.getAllDynamicContextSpecificDataTags()!
        
        switch tagging{
        case 1:
            try! self.additionalData!.setUnreserved(additionalUnrestrictedData, forTag: rootSubTag);
        case 2:
            try! self.additionalData!.setDynamicTag(additionalUnrestrictedData)
        case 3:
            try! self.setUnreservedDataForTagString(rootSubTag, data: additionalUnrestrictedData)
        default:
            break;
        }
    }
    public func setMerchantIdetifier(mi:MerchantIdentifier, data:String){
        switch mi{
        case .merchantIdentifierVisa02:
            self.merchantIdentifierVisa02 = data
            break;
        case .merchantIdentifierVisa03:
            self.merchantIdentifierVisa03 = data
            break;
        case .merchantIdentifierMastercard04:
            self.merchantIdentifierMastercard04=data;
            break;
        case .merchantIdentifierMastercard05:
            self.merchantIdentifierMastercard05=data;
            break;
        case .merchantIdentifierNPCI06:
            self.merchantIdentifierNPCI06=data;
            break;
        case .merchantIdentifierNPCI07:
            self.merchantIdentifierNPCI07=data;
            break;
        case .merchantIdentifierIFSCCODE08:
            self.merchantIdentifierIFSCCODE08=data;
            break;
        case .merchantIdentifierDISCOVER09:
            self.merchantIdentifierDISCOVER09=data;
            break;
        case .merchantIdentifierDISCOVER10:
            self.merchantIdentifierDISCOVER10=data;
            break;
        case .merchantIdentifierAMEX11:
            self.merchantIdentifierAMEX11=data;
            break;
        case .merchantIdentifierAMEX12:
            self.merchantIdentifierAMEX12=data;
            break;
        case .merchantIdentifierJCB13:
            self.merchantIdentifierJCB13=data;
            break;
        case .merchantIdentifierJCB14:
            self.merchantIdentifierJCB14=data;
            break;
        case .merchantIdentifierUNIONPAY15:
            self.merchantIdentifierUNIONPAY15=data;
            break;
        case .merchantIdentifierUNIONPAY16:
            self.merchantIdentifierUNIONPAY16=data;
            break;
        }
    }
    
    
    
}



