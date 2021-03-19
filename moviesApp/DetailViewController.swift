//
//  DetailViewController.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var voteAverageLabel: UILabel!
    
    var titleString:String?
    var dateString:String?
    var overviewString:String?
    var voteDouble:Double?
    var imageString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.load(url: imageString!)
        titleLabel.text = titleString
        dateLabel.text = dateString
        overviewLabel.text = overviewString
        voteAverageLabel.text = "\(voteDouble!)"
        // Do any additional setup after loading the view.
    }
}
