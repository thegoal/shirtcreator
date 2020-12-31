//
//  ImageViewExtension.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func showImageWith(url:URL) {
        self.setImageWith(url, placeholderImage: UIImage(named: "placeholderImage")) // Set image and cache with SDWebImage
    }
}
