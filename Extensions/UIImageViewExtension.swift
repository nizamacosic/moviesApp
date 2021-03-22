//
//  UIImageViewExtension.swift
//  moviesApp
//
//  Created by MBP on 19/03/2021.
//

import Foundation
import SwiftUI

extension UIImageView {
    
    func load(url: String) {

        let url = URL(string: url)!
           DispatchQueue.global().async { [weak self] in
               if let data = try? Data(contentsOf: url) {
                   if let image = UIImage(data: data) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }

}
