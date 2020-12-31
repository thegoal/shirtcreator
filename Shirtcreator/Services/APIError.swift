//
//  APIError.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation

enum ErrorType {
    case noInternet // In case no internet connected
    case generic  // In case somthing unknown happend
    case validation // In case error from our server
    case alert // error for not selcted images
}

class APIError:Error {
    var errorMessage:String? // Error Message to show in Alert
    var title:String? // Title to show in Alert
    var errorCode:Int? // Error Code if needs to check on what kind of error recieve
    var errorType:ErrorType? // Error type to measure action for error
    
    init(message:String = Constants.genericErrorMessage , errorType:ErrorType = .generic) {
        self.errorType = errorType
        switch errorType {
        case .generic:
            self.title = Constants.error
            self.errorMessage = Constants.genericErrorMessage
        case .noInternet:
            self.title = Constants.noInternet
            self.errorMessage = Constants.noInternet
        case .validation:
            self.errorMessage = message
            self.title = Constants.validationFailed
        case .alert:
            self.errorMessage = message
            self.title = Constants.OOPPSS
        }
    }
}
