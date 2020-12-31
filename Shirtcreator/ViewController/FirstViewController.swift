//
//  ThirdViewController.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if SelectionManager.shared.selctedImages.currentSelected == nil {
            Utility.showAlert(message: "Please select image to view!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstViewControllerSegue"{
            let controller = segue.destination as! SelectedImageViewController
            controller.isCurrent = true // Letting know SelectedImageViewController that if show current ot previous image
        }
    }
}
