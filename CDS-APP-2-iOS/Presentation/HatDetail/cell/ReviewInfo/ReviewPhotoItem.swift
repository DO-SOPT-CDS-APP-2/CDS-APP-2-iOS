//
//  ReviewPhotoItem.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

struct ReviewPhotoItem {
    let image: UIImage
}

extension ReviewPhotoItem{
    static func reviewPhotoDummy() -> [ReviewPhotoItem] {
        return [
            ReviewPhotoItem(image: ImageLiterals.img.imgReview1),
            ReviewPhotoItem(image: ImageLiterals.img.imgReview2),
            ReviewPhotoItem(image: ImageLiterals.img.imgReview3),
            ReviewPhotoItem(image: ImageLiterals.img.imgReview4),
            ReviewPhotoItem(image: ImageLiterals.img.imgReview5),
            ReviewPhotoItem(image: ImageLiterals.img.imgReview6)
        ]
    }
    
}

