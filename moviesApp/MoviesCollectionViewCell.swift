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
    @IBOutlet var label: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet var selectButton: UIButton!
    
    var delegate: MoviesCollectionViewCellDelegate?
    
    //var isActive = false
    
    @IBAction func didTapSelectButton(_ sender: UIButton) {
        
        delegate?.selectedCell(cell: self)
        
    }
    
    
    func setup(with result: Result) {
        //MARK: Content
        image.load(url: Constants.API.urlImageBase + result.posterPath)
        label.text = result.title
        
        if result.selected {
            selectButton.setImage(UIImage(named: "selected"), for: .normal)
        } else {
            selectButton.setImage(UIImage(named: "unselected"), for: .normal)
        }
        selectButton.changeButtonColor(.lightGray)

        setGradient()
    }
    
    private func setGradient() {        
        let gradientLayer = CAGradientLayer()
        
        if let sublayers = view.layer.sublayers {
            for sublayer in sublayers where sublayer.name == "cellGradient"  {
                return
            }
        }
        
        gradientLayer.name = "cellGradient"
        gradientLayer.type = .axial
        gradientLayer.colors = [
            UIColor.black.cgColor,
            UIColor.clear.cgColor ]
        
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
}

