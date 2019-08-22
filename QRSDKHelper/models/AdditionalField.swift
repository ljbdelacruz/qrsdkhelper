//
//  AdditionalField.swift
//  QRSDKHelper
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 ljbdelacruz. All rights reserved.
//

import Foundation
public class AdditionalFieldModel{
    public var fieldName:String="";
    public var value:String="";
    public init(){
    }
    public convenience init(fieldName:String, value:String){
        self.init()
        self.fieldName=fieldName;
        self.value=value;
    }
}
