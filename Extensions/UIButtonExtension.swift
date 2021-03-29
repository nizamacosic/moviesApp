//
//  UIButtonExtension.swift
//  moviesApp
//
//  Created by Timur Besirovic on 22. 3. 2021..
//

import UIKit

extension UIButton {
    
    func changeButtonColor(_ color: UIColor) {
         let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
         self.setImage(tintedImage, for: .normal)
         self.tintColor = color
     }
}
