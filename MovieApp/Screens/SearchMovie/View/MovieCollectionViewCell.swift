//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/5/23.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.systemGray.cgColor
        self.contentView.layer.borderWidth = 5
        self.contentView.layer.cornerRadius = 10
        
        movieImage.layer.cornerRadius = 5
    }
    
    func setup(with movie: Response) {
        
        movieImage.image = nil
        
        if let url = movie.poster?.url {
            let fullUrl = Constants.method + url
            let imageUrl = URL(string: fullUrl)
            
            movieImage.sd_setImage(with: imageUrl) { [weak self] (image, error, cacheType, url) in
                if url?.absoluteString == fullUrl {
                    self?.movieImage.image = image
                }
            }
        }
        movieTitle.text = movie.title
        movieDescription.text = movie.description
    }
}
