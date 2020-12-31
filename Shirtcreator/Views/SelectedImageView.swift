//
//  SelectedImageView.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class SelectedImageView: UIView {
    @IBOutlet weak var selectedImage:UIImageView?
    func showSelectedImage(url:URL)  {
        self.selectedImage?.showImageWith(url: url)
    }
}
