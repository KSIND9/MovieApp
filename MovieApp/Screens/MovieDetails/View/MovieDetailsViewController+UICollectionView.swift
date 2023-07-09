//
//  MovieDetailsViewController+UICollectionView.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/9/23.
//

import UIKit
import SDWebImage

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return caraouselImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieDetailsCollectionViewCell, for: indexPath) as! MovieDetailsCollectionViewCell
        let imageURLString = caraouselImages[indexPath.item]
        let img = URL(string: imageURLString)
        cell.caraouselImages.sd_setImage(with: img, completed: nil)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height - collectionView.contentInset.top - collectionView.contentInset.bottom)
    }
}
