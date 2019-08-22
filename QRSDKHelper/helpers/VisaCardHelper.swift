//
//  VisaCardHelper.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MVisaQRParser

class VisaCardHelper{
    static func parseQR(tlv:String, completionHandler: @escaping (QRCodeData?) -> ()){
        QRCodeParser.parseQRData(qrCodeString: tlv) { (parserResponse) in
            if let r = parserResponse!.qrCodeData {
                if r.mVisaMerchantID == nil{
                    completionHandler(nil);
                }else{
                    completionHandler(r);
                }
            } else {
                print("Error Code: \n" + parserResponse!.qrCodeError!.description + "\n")
                completionHandler(nil);
            }
        }
    }
    static func generateQR(tlv:String?, size:CGSize)->UIImage{
        guard let stringForQrCode = tlv else {
            var qrCode = QRCode("no data available")
            let qrCodeImage = qrCode?.image
            qrCode?.size = size
            return qrCodeImage!
        }
        var qrCode = QRCode(stringForQrCode)
        let qrCodeImage = qrCode?.image
        qrCode?.size = size
        return qrCodeImage!
    }
    
}
