//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/5/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movieViewModel: MovieViewModel = MovieViewModel()
    var movieData: [Response] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        bindingViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if movieViewModel.movieData.value?.isEmpty ?? true {
            movieViewModel.getData()
        }
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func bindingViewModel() {
        movieViewModel.isLoading.bind { [weak self] isloading in
            guard let self, let isloading = isloading else {
                return
            }
            DispatchQueue.main.async {
                if isloading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        movieViewModel.movieData.bind { [weak self] movies in
            guard let self, let movies = movies else {
                return
            }
            self.movieData = movies
            self.reloadCollectionView()
        }
    }
    
    func openDetails(movieId: Int) {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: Constants.movieDetailsViewController) as? MovieDetailsViewController else {
            return
        }
        detailsViewController.movieId = movieId
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: self.movieData[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieViewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movieId = self.movieData[indexPath.row].originalId {
            self.openDetails(movieId: movieId)
        }
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
