//
//  ImageSelectionCell.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit
import SDWebImage

class ImageSelectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView:UIImageView?
    @IBOutlet weak var selectedImage:UIImageView? // to show if cell is selected on nots
    
    func configure(with imageData:ImageModel)  {
        self.imageView?.showImageWith(url: URL(string: imageData.urlString!)!)
        if imageData.isSelected { // Check if image is selected or not
            self.selectedImage?.isHidden = false // Image is random from server :)
        }else{
            self.selectedImage?.isHidden = true
        }
    }
}

