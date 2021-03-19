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
        image.load(url: result.posterPath, baseUrl: Constants.Design.Image.urlBase)
        label.text = result.title
    }
}

