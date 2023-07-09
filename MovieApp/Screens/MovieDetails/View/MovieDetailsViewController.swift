//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/6/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailImageCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var movieDetailsTitle: UILabel!
    @IBOutlet weak var crewMembers: UILabel!
    @IBOutlet weak var movieDetailsDesc: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var detailsDataSource: MovieDetailsResponse?
    var movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    var movieId: Int = 0
    var timer: Timer?
    var currentCellIndex = 0
    
    internal lazy var caraouselImages: [String] = {
        var images = [String]()
        if let artworkDetails = detailsDataSource?.artwork {
            for (_, artwork) in artworkDetails {
                if let artworkURL = artwork.url {
                    images.append(artworkURL)
                }
            }
        }
        if let posterURL = detailsDataSource?.poster?.url {
            images.append(posterURL)
        }
        return images
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movieDetailsViewModel.getMovieDetails(movieId)
    }
    
    func bindingViewModel() {
        movieDetailsViewModel.isLoading.bind { [weak self] isloading in
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
        movieDetailsViewModel.movieDetailDataSource.bind { [weak self] movieDetails in
            guard let self, let movieDetails = movieDetails else {
                return
            }
            self.detailsDataSource = movieDetails
            self.configCaraouselImages()
            DispatchQueue.main.async {
                self.detailImageCollectionView.reloadData()
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
                self.pageControl.numberOfPages = self.caraouselImages.count
                self.setupUI()
            }
        }
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        currentCellIndex = sender.currentPage
        let indexPath = IndexPath(item: currentCellIndex, section: 0)
        detailImageCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    func setupUI() {
        movieDetailsTitle.text = detailsDataSource?.title
        movieDetailsDesc.text = detailsDataSource?.description
        setupCrewMembers()
    }
    
    @objc func slideToNext() {
        if caraouselImages.isEmpty {
            return
        }
        let nextPage = (currentCellIndex + 1) % caraouselImages.count
        let indexPath = IndexPath(item: nextPage, section: 0)
        detailImageCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        currentCellIndex = nextPage
        pageControl.currentPage = currentCellIndex
    }
    
    func setupCrewMembers() {
        var crewNames: [String] = []
        if let actorCrew = detailsDataSource?.crew?.actor {
            let actorNames = actorCrew.compactMap { $0.fullname }
            crewNames += actorNames
        }
        if let directorCrew = detailsDataSource?.crew?.director {
            let directorNames = directorCrew.compactMap { $0.fullname }
            crewNames += directorNames
        }
        crewMembers.text = crewNames.joined(separator: ", ")
    }
    
    func configCaraouselImages() {
        if let artworkDetails = self.detailsDataSource?.artwork {
            for (_, artwork) in artworkDetails {
                if let artworkURL = artwork.url {
                    self.caraouselImages.append(artworkURL)
                }
            }
        }
        if let posterURL = self.detailsDataSource?.poster?.url {
            self.caraouselImages.append(posterURL)
        }
    }
}
