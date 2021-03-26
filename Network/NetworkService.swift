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
    func getData(handler: @escaping (Movies) ->()) {
        AF.request(Constants.API.apiUrl + Constants.API.apiKey).responseDecodable(of: Movies.self) {
            response in
            let movies = response.value
            handler(movies!)
            //movies = response.value
            //collection.reloadData()
        }
    }
}
