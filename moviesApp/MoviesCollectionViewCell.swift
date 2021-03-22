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
    @IBOutlet var view: UIView!
    
    func setup(with result: Result) {
        image.load(url: Constants.API.urlImageBase + result.posterPath)
        label.text = result.title
    }
    func setLayout()
    {
        image.contentMode = .scaleAspectFill
        //MARK: Gradient for UIView
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.clear.cgColor
        ]
       
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.layer.addSublayer(label.layer)
    }
}

