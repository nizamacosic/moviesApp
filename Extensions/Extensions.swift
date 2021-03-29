//
//  Extensions.swift
//  moviesApp
//
//  Created by MBP on 19/03/2021.
//

import Foundation

extension UIImageView {
    func load(url: String) {

        let url = URL(string: Constants.Design.Image.urlBase + url)!
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
