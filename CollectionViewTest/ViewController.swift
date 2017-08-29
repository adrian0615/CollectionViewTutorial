//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Adrian McDaniel on 8/29/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var galleryItems: [GalleryItem] = [] // NEW PROPERTY

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    fileprivate func initGalleryItems() {
        
        var items = [GalleryItem]()
        let inputFile = Bundle.main.path(forResource: "items", ofType: "plist")
        
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let galleryItem = GalleryItem(dataDictionary: inputItem)
            items.append(galleryItem)
        }
        
        galleryItems = items
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGalleryItems()
        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryItemCollectionViewCell", for: indexPath) as! GalleryItemCollectionViewCell
        
        cell.setGalleryItem(galleryItems[indexPath.row])
        return cell
        
    }
    
    //Suplementary View Method - Supplementary views are usually used to implement the header and the footer view.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let commentView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GalleryItemCommentCollectionReusableView", for: indexPath) as! GalleryItemCommentCollectionReusableView
        
        commentView.commentLabel.text = "Supplementary view of kind \(kind)"
        
        return commentView
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewFlowLayout
    
    //The last step is to dynamically change cell sizes and insets. Using a constant height or width might sometimes be not enough. UICollectionViewFlowLayout has multiple options that can also be changed dynamically by implementing UICollectionViewDelegateFlowLayout.
    
    //Here we change dynamically some layout options, so our gridview will look nice in both portrait and landscape modes.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }

}

