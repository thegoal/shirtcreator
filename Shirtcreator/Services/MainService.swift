//
//  MainService.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation

class MainService: BaseService {
    
    // Download and parse API response
    
    func downloadImagesURL(completion: @escaping (Result<[ImageModel], APIError>) -> Void) {
        let urlRequest = self.requestWithUrl(apiUrl: APIConstants().imagesfetchURl(),param: [:], httpMethod: .GET)
        self.callAPI(request: urlRequest) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success :
                    do {
                        let response = try result.get()
                        if let serverData = response as? [String] {
                            let images = serverData.map {ImageModel(urlString: $0) } // Convert array of stings to model so we can show data in views
                            completion(.success(images))
                        }else{
                            completion(.failure(APIError()))
                        }
                    }catch{
                        completion(.failure(APIError()))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
