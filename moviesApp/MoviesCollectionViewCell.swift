//
//  MoviesCollectionViewCell.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit


protocol MoviesCollectionViewCellDelegate {
    func selectedCell(cell: MoviesCollectionViewCell)
}

class MoviesCollectionViewCell: UICollectionViewCell {
    
    //MARK: -IBOutlets
    @IBOutlet var label: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet var selectButton: UIButton!
    
    //MARK: -Class properties
    var delegate: MoviesCollectionViewCellDelegate?
    
    //MARK: -IBActions
    @IBAction func didTapSelectButton(_ sender: UIButton) {
        
        delegate?.selectedCell(cell: self)
    }
    
    // MARK: -Cell content and UI setup
    func setup(with result: Result) {
        
        image.load(url: Constants.API.urlImageBase + result.posterPath)
        label.text = result.title
        
        if result.selected {
            selectButton.setImage(UIImage(named: "selected"), for: .normal)
        } else {
            selectButton.setImage(UIImage(named: "unselected"), for: .normal)
        }
        selectButton.changeButtonColor(.lightGray)
        image.contentMode = .scaleAspectFill
        setGradient()
        
    }
    
    //MARK: -UIView gradient
    private func setGradient() {
        if view.layer.sublayers!.count < 2 {
            let gradient = CAGradientLayer()
            gradient.type = .axial
            gradient.colors = [
                UIColor.black.cgColor,
                UIColor.clear.cgColor ]
            gradient.locations = [0]
            gradient.frame = view.bounds
            view.layer.addSublayer(gradient)
            view.layer.addSublayer(label.layer)
            
        }
    }
}
