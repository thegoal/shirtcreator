//
//  MainViewModel.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit
import MBProgressHUD

class MainViewModel {
    
    var mainView:MainView? // view refernce to update UI after processing done in model.
    
    func setupUI(){
        self.loadImagesFromServer()
    }
    
    func loadImagesFromServer() {
        MBProgressHUD.showAdded(to: self.mainView!, animated: true)
        MainService().downloadImagesURL(){ results in
            switch results {
            case .success(let responseData):
                MBProgressHUD.hide(for: self.mainView!, animated: true)
                self.mainView?.collectionView?.reloadData()
                // Append content will support paging as well
                self.mainView?.imagesList.append(contentsOf: responseData)
                
            case .failure(let error):
                MBProgressHUD.hide(for: self.mainView!, animated: true)
                Utility.showAlert(error: error){ results in
                    if results {
                        self.loadImagesFromServer()
                    }
                    return nil
                }
            }
        }
    }
    
}
