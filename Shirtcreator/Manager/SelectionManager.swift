//
//  SelectionManager.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation

class SelectionManager: NSObject {
    static let shared = SelectionManager()
    var selctedImages = SelectedImages()
    
    func updateSelectedImage(urlString:String) {
        if SelectionManager.shared.selctedImages.currentSelected != nil { // Check if its first selection or not
            // If not first than move current to previous
            SelectionManager.shared.selctedImages.previousSelected = SelectionManager.shared.selctedImages.currentSelected
            SelectionManager.shared.selctedImages.currentSelected = urlString
        }else{
            // Set current selected first time
            SelectionManager.shared.selctedImages.currentSelected = urlString
        }
    }
}
