//
//  SelectedImageViewController.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

// Embeded view so can be reused in both first and second

class SelectedImageViewController: UIViewController {

    var selectedImageView:SelectedImageView!
    var isCurrent:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedImageView = (self.view as! SelectedImageView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Instead of updating from both first and second , Updating image just here 
    
        if let view  = self.selectedImageView{
            if self.isCurrent{ // Checking if need to show current selected image
                if let url = SelectionManager.shared.selctedImages.currentSelected{
                    view.selectedImage?.showImageWith(url: URL.init(string: url)!)
                }
            }else{
                if let url = SelectionManager.shared.selctedImages.previousSelected{
                    view.selectedImage?.showImageWith(url: URL.init(string: url)!)
                }
            }
        }
    }

}
