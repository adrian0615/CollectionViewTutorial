//
//  GalleryItem.swift
//  CollectionViewTest
//
//  Created by Adrian McDaniel on 8/29/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import Foundation


class GalleryItem {
    
    var itemImage: String
    
    init(dataDictionary: [String: String]) {
        itemImage = dataDictionary["itemImage"]!
    }
    
    class func newGalleryItem(_ dataDictionary: [String: String]) -> GalleryItem {
        return GalleryItem(dataDictionary: dataDictionary)
}

}
