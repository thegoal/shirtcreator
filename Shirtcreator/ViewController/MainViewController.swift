//
//  ViewController.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class MainViewController: UIViewController {
    var mainViewModel = MainViewModel() // View model to load data from server and pass it to view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewModel.mainView = self.view as? MainView
        self.mainViewModel.loadImagesFromServer()
    }
}

