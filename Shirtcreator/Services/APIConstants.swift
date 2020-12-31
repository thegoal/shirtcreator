//
//  APIConstants.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation

enum HTTPMethod:String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

struct APIConstants {
    let baseURL = URL(string: "https://abihome-test.herokuapp.com/test/")! // If there are multiple API this will work as start url
    
    func imagesfetchURl() -> URL {
        return self.relativeURL(path: "images")
    }
    
    func relativeURL(path: String) -> URL {
        if let url = URL(string: path , relativeTo: baseURL) {
            return url
        }
        return baseURL
    }
}




