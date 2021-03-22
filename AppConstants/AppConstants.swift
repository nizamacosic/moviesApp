//
//  AppConstants.swift
//  moviesApp
//
//  Created by MBP on 19/03/2021.
//

import Foundation

struct Constants {
    
    struct Design {
        
        struct Image {
            
            static let urlBase = "https://image.tmdb.org/t/p/w342"
        }
    }
    
    struct Content {
        static let overviewLabelText = "Overview: "
        static let releaseDateLabelText = "Release date: "
        static let voteAverageLabelText = "Rate: "
    }
    
    struct Identifiers {
        static let DetailViewControllerIdentifier = "details"
        static let MoviesCollectionViewCellIdentifiers = "MoviesCollectionViewCell"
    }
    
    struct API {
        static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        static let apiUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key="
        static let urlImageBase = "https://image.tmdb.org/t/p/w342"
    }
}
