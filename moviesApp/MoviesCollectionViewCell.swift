//
//  MoviesCollectionViewCell.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var image: UIImageView!
    
    func setup(with result: Result) {
        image.load(url: Constants.API.urlImageBase + result.posterPath)
        label.text = result.title
    }
}

