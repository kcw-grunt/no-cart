//
//  CurrencyHelper.swift
//  KCWInterview
//
//  Created by Kerry Washington on 9/2/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import Foundation

class CurrencyHelper : NSObject {
 
    class func getSymbol() -> String {
            let locale = Locale.current
            return locale.currencySymbol!
    }
}
