//
//  GalleryItemCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Adrian McDaniel on 8/29/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    func setGalleryItem(_ item: GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
}
