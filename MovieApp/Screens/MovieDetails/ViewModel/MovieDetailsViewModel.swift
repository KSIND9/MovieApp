//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/7/23.
//

import Foundation

class MovieDetailsViewModel {
        
    var isLoading: Observable<Bool> = Observable(false)
    var movieDetailDataSource: Observable<MovieDetailsResponse> = Observable(nil)
    var detailDataSource: MovieDetails?
    
    func getMovieDetails(_ movieId: Int) {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        let urlString = "\(Constants.baseURl)\(Constants.detailsApi)\(movieId)"
        NetworkManager<MovieDetails>.fetchData(from: urlString) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.detailDataSource = data
                self?.mapDetailsData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapDetailsData() {
        self.movieDetailDataSource.value = self.detailDataSource?.movieDetailsresponse
    }
}
