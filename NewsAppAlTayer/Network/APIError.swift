//
//  APIError.swift
//  OV_SSS_iOS
//
//  Created by Fazeel Ahmed on 1/27/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case apiError(error : String)
    case noResponse(statusCode : String)
    case otherResponse(statusCode : Any)

    var localizedDescription: Any {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .apiError(let error): return error
        case .noResponse(let statusCode) : return statusCode
        case .otherResponse(let statusCode): return statusCode
        }
    }
}

 enum FlashErrorTypes : String {
    case paymentRequired  = "PaymentMethodRequired"
    case billingAddressRequired  = "BillingAddressRequired"
    case orderTotal  = "OrderTotalNotSet"
    case shippingAddressRequired  = "ShippingAddressRequired"
    case shippingMethodRequired  = "ShippingMethodRequired"
    case shippingItemPriceMissing  = "ShippingItemAdjustedPriceNotSet"
}
