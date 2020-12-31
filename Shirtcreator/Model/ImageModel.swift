//
//  ImageModel.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation
import UIKit

class ImageModel: NSObject {
    
    var urlString:String? // Image url String
    var isSelected:Bool = false
    
    init(urlString:String) {
        self.urlString = urlString
    }
}
