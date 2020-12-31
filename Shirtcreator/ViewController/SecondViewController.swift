//
//  SecondViewController.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if SelectionManager.shared.selctedImages.previousSelected == nil {
            Utility.showAlert(message: "Please select image to view!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewControllerSegue"{
            let controller = segue.destination as! SelectedImageViewController
            controller.isCurrent = false
        }
    }
}
