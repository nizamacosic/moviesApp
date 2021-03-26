//
//  NetworkService.swift
//  moviesApp
//
//  Created by MBP on 26/03/2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
    
    // MARK: -Fetching data from API
    func getData(handler: @escaping (Movies?, Error?) ->()) {
        AF.request(Constants.API.apiUrl + Constants.API.apiKey).responseDecodable(of: Movies.self) {
            response in
            if let error = response.error {
                handler(nil, error)
            }
            else {
                let movies = response.value
                handler(movies!, nil)
            }
        }
    }
}
