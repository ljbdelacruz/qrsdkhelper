//
//  MCardHelper.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
import MPQRCoreSDK

public class MasterCCardHelper{
    static func parseQRCode(tlv: String)->(PushPaymentData?, String?){
        do {
            // Parse qr code
            let pushData = try MPQRParser.parse(string:tlv)
            return (pushData, nil);
        } catch let error as MPQRError{
            if let str = error.getString(){
                return (nil, "Error: \(str)")
            }else{
                return (nil, "Unknown error occurred \(error)");
            }
        } catch{
            return (nil, "Unknown error occurred \(error)");
        }
    }
    static func generateQR(tlv:String?, size:CGSize)->UIImage?{
        guard let stringForQrCode = tlv else{
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
    static func generateQRCode(tlv: String) -> UIImage? {
        let data = tlv.data(using: String.Encoding.utf8)
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
    
    
    
    
    
}

