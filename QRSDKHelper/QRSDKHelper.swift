//
//  QRSDKHelper.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation


public class QRSDKHelper{
    var qrCodeData: QRCodeDataStandard!
    public static func processTLV(tlv:String, successHandler: @escaping ((QRCodeDataStandard, String)->Void), errorHandler: @escaping ((String)->Void)){
        VisaCardHelper.parseQR(tlv: tlv, completionHandler: { (r) in
            if r != nil{
                let qrCodeData=QRCodeDataStandard(qrData: r!);
                successHandler(qrCodeData, "");
                //success
            }else{
                //master card qr parse
                let (data, error)=MasterCCardHelper.parseQRCode(tlv: tlv);
                if error == nil && data != nil{
                    let qrCodeData=QRCodeDataStandard(qrData: data!);
                    successHandler(qrCodeData, "");
                }else{
                    errorHandler("failed processing the QR Code");
                }
            }
        })
    }
    public func getQRData()->QRCodeDataStandard{
        return self.qrCodeData;
    }
    //MARK: static methods
    //MARK: Currency
    public static func getCurrencyList()->[MyCurrencyModel]{
        return MyCurrencyModel.SortAlphabetically(array: CurrencySymbolHelper.instance.getCurrencySymbols());
    }
    //MARK: Currency Setup
    public static func getCurrencySymbol(numCode:String)->String{
        return CurrencySymbolHelper.instance.getCurrencySymbol(numCode);
    }
    public static func getAlphaCode(numCode:String)->String{
        return CurrencySymbolHelper.instance.getAlphaCode(fromNumericCode: numCode)
    }
    //MARK: MasterCardFunc
    public static func GenerateQR(tlv:String, size:CGSize, type:MyCardType)->UIImage?{
        if type == .mastercard{
            return MasterCCardHelper.generateQRCode(tlv: tlv)!
        }else if type == .visa{
            return VisaCardHelper.generateQR(tlv: tlv, size: size);
        }
        return nil;
    }
    
}
