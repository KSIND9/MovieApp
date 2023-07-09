//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/5/23.
//

import Foundation

class MovieViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var movieData: Observable<[Response]> = Observable(nil)
    var dataSource: Movie?
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.response.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        let urlString = "\(Constants.baseURl)\(Constants.searchApi)"
        NetworkManager<Movie>.fetchData(from: urlString) { [weak self] result in
            guard let self else { return }
            self.isLoading.value = false
            switch result {
            case .success(let data):
                print(data.response.count)
                self.dataSource = data
                self.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.movieData.value = self.dataSource?.response ?? []
    }
}
