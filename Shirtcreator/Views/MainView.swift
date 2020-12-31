//
//  MainView.swift
//  ShirtcreatorTest
//
//  Created by Ishaq on 12/31/20.
//

import UIKit

class MainView: UIView {
    
    var imagesList:[ImageModel] = [] // List of data from server
    @IBOutlet weak var collectionView:UICollectionView!{
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
}


// MARK: - UICollectionViewDataSource protocol // We can add seprate view for collection view as well

extension MainView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200) // Can be updated according to UI
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSelectionCell", for: indexPath as IndexPath) as! ImageSelectionCell
        cell.configure(with: self.imagesList[indexPath.row])
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageData = self.imagesList[indexPath.row]
        if !imageData.isSelected { // Check if image already selected no need to select again
            self.imagesList.filter {$0.isSelected == true}.first?.isSelected = false
            imageData.isSelected = !imageData.isSelected
            SelectionManager.shared.updateSelectedImage(urlString:imageData.urlString!) // Update url string in manager
            self.collectionView.reloadData()
        }
    }
}
