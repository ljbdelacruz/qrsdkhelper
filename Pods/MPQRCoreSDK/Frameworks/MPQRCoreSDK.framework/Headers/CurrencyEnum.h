//
//  CurrencyEnum.h
//  MPQRCoreSDKV2
//
//  Created by MasterCard on 22/9/17.
//  Copyright © 2017 MasterCard. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Currency of each country in the world.
 */
typedef NS_ENUM(NSInteger, CurrencyEnum) {
    ADP,
    AED,
    AFA,
    AFN,
    ALL,
    AMD,
    ANG,
    AOA,
    ARS,
    ATS,
    AUD,
    AWG,
    AYM,
    AZM,
    AZN,
    BAM,
    BBD,
    BDT,
    BEF,
    BGL,
    BGN,
    BHD,
    BIF,
    BMD,
    BND,
    BOB,
    BOV,
    BRL,
    bsd,
    BTN,
    BWP,
    BYB,
    BYR,
    BYN,
    BZD,
    CAD,
    CDF,
    CHE,
    CHF,
    CHW,
    CLF,
    CLP,
    CNY,
    COP,
    COU,
    CRC,
    CSD,
    CUC,
    CUP,
    CVE,
    CYP,
    CZK,
    DEM,
    DJF,
    DKK,
    DOP,
    DZD,
    EEK,
    EGP,
    ERN,
    ESP,
    ETB,
    EUR,
    FIM,
    FJD,
    FKP,
    FRF,
    GBP,
    GEL,
    GHC,
    GHS,
    GIP,
    GMD,
    GNF,
    GTQ,
    GWP,
    GYD,
    HKD,
    HNL,
    HRK,
    HTG,
    HUF,
    IDR,
    IEP,
    ILS,
    INR,
    IQD,
    IRR,
    ISK,
    ITL,
    JMD,
    JOD,
    JPY,
    KES,
    KGS,
    KHR,
    KMF,
    KPW,
    KRW,
    KWD,
    KYD,
    KZT,
    LAK,
    LBP,
    LKR,
    LRD,
    LSL,
    LVL,
    LYD,
    MAD,
    MDL,
    MGA,
    MGF,
    MKD,
    MMK,
    MNT,
    MOP,
    MRO,
    MTL,
    MUR,
    MVR,
    MWK,
    MXN,
    MXV,
    MYR,
    MZN,
    NAD,
    NGN,
    NIO,
    NLG,
    NOK,
    NPR,
    NZD,
    OMR,
    PAB,
    PEN,
    PGK,
    PHP,
    PKR,
    PLN,
    PTE,
    PYG,
    QAR,
    ROL,
    RON,
    RSD,
    RUB,
    RWF,
    SAR,
    SBD,
    SCR,
    SDD,
    SDG,
    SEK,
    SGD,
    SHP,
    SIT,
    SKK,
    SLL,
    SOS,
    SRD,
    SRG,
    SSP,
    STD,
    SVC,
    SYP,
    SZL,
    THB,
    TJS,
    TMM,
    TMT,
    TND,
    TOP,
    TPE,
    TRL,
    TRY,
    TTD,
    TWD,
    TZS,
    UAH,
    UGX,
    USD,
    USN,
    USS,
    UYI,
    UYU,
    UZS,
    VEB,
    VEF,
    VND,
    VUV,
    WST,
    XAF,
    XAG,
    XAU,
    XBA,
    XBB,
    XBC,
    XBD,
    XCD,
    XDR,
    XOF,
    XPD,
    XPF,
    XPT,
    XSU,
    XTS,
    XUA,
    XXX,
    YER,
    YUM,
    ZAR,
    ZMK,
    ZMW,
    ZWD,
    ZWL,
    ZWN,
    ZWR,
};

/**
 Look up class to access value and set value for enum `CurrencyEnum`.
 */
@interface CurrencyEnumLookup : NSObject

/**
 The function return the currecncy number
 @param inputEnum Currency enum
 @return Correcponding currency code in numeric form
 */
+ (NSString* _Nullable) getCurrencyCodeNumeric:(enum CurrencyEnum) inputEnum;
/**
 The function return the alpha code of the currency enum
 @param inputEnum Currency enum
 @return Correcponding currency code in alpha form
 */
+ (NSString* _Nullable) getAlphaCode:(enum CurrencyEnum) inputEnum;
/**
 The function return the currency enum given string input
 @param input String representation of currency
 @return Correcponding currency enum
 */
+ (enum CurrencyEnum) enumFor:(NSString* _Nonnull) input;

/**
 Each of currency have specific number of decimal point
 @param input String representing the currency
 @return Number of possible decimal value of the currency
 */
+ (int) getDecimalPointOfAlphaCode:(NSString* _Nonnull) input;

@end
