//
//  Alerts.swift
//  moviesApp
//
//  Created by MBP on 29/03/2021.
//

import Foundation
import SwiftUI

class Alerts {
    
    static let shared = Alerts()
    
    func ShowBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelOKAction = UIAlertAction(title: "OK", style: .destructive, handler: { action in
            exit(0)
        })
        
        alert.addAction(cancelOKAction)
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
}
