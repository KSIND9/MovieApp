//
//  MovieDetailsCollectionViewCell.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/7/23.
//

import UIKit

class MovieDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var caraouselImages: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        caraouselImages.sd_cancelCurrentImageLoad()
    }
    
}
