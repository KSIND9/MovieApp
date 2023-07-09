//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/5/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case cannotParseData
    case noData
}

public class NetworkManager<T: Decodable> {
    
    static func fetchData(from urlString: String, completionHandler: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(resultData))
                } catch let decodingError {
                    let errorDescription = "JSON decoding error: \(decodingError)"
                    let errorMessage = "JSON decoding error: \(decodingError.localizedDescription)"
                    print(errorDescription)
                    print(errorMessage)
                    completionHandler(.failure(.cannotParseData))
                }
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }.resume()
    }
}

