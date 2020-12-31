//
//  BaseService.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation

import UIKit
import AFNetworking
class BaseService: NSObject {
    
    let sessionManager = AFHTTPSessionManager(sessionConfiguration:URLSessionConfiguration.default) // Shared session so if need to cancel task can be done at once
    
    func cancelAllTasks(){
        for task in self.sessionManager.dataTasks {
            task.cancel()
        }
    }
    
    // Generic request method , Call from a ny service to create URLRequest
    
    func requestWithUrl(apiUrl:URL, param:[String : Any] , httpMethod : HTTPMethod) -> URLRequest {
        var urlRequest = URLRequest(url: apiUrl)
        if  param.count > 0  {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
                urlRequest.httpBody = jsonData
            } catch let e {
                print(e)
            }
        }
        urlRequest.httpMethod = httpMethod.rawValue
        return urlRequest
    }
    
    // Geneirc API call method to interact with server
    
    public func callAPI(request: URLRequest,completion: @escaping (Result<Any, APIError>) -> Void){
        let task = self.sessionManager.dataTask(with: request, uploadProgress: nil, downloadProgress: nil){
            (response , data , error) -> Void in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let responseData = data {
                        completion(.success(responseData))
                    }else if data == nil {
                        completion(.failure(APIError()))
                    }
                }else{
                    if (error != nil) {
                        completion(.failure(APIError(message: error!.localizedDescription, errorType: .validation)))
                    }else{
                        completion(.failure(APIError()))
                    }
                }
            }else{
                if (error != nil) {
                    completion(.failure(APIError(message: error!.localizedDescription, errorType: .validation)))
                }else{
                    completion(.failure(APIError()))
                }
            }
        }
        
        task.resume()
    }
}
