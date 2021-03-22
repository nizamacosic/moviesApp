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
    @IBOutlet var selectButton: UIButton!
    
    var isActive = false
    @IBAction func didTapSelectButton(_ sender: UIButton) {
    
        if isActive {
            isActive = false
            selectButton.setImage(UIImage(named: "selected.png"), for: .normal)
        }
        else {
            isActive = true
            selectButton.setImage(UIImage(named: "unselected.png"), for: .normal)
        }
    }
    
    
    func setup(with result: Result) {
        //MARK: Content
        image.load(url: Constants.API.urlImageBase + result.posterPath)
        label.text = result.title
        
        //MARK: Image fill
        image.contentMode = .scaleAspectFill
        //MARK: Gradient for UIView
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.clear.cgColor ]
        
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.layer.addSublayer(label.layer)
    }
}

