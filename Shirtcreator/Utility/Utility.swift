//
//  Utility.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class Utility {
    
    // Show alert and handle retry call back
    
    class func showAlert(error:APIError, retry:Bool = true,completion: @escaping (Bool) -> Void?){
        
        let alert = UIAlertController(title:error.title, message: error.errorMessage, preferredStyle: .alert)
        
        if retry {
            let ok = UIAlertAction(title: Constants.retry, style: .default, handler: { action in
                completion(true)
            })
            alert.addAction(ok)
        }
        let cancel = UIAlertAction(title: Constants.Cancel, style: .default, handler: { action in
            completion(false)
        })
        
        
        alert.addAction(cancel)
        
        let delegate = AppDelegate().SharedDelegate()
        delegate.window?.rootViewController!.present(alert, animated: true)
    }
    
    class func showAlert(message:String){
        let error = APIError.init(message: message, errorType: .alert)
        self.showAlert(error: error,retry: false) { results in
            return nil
        }
    }
}


