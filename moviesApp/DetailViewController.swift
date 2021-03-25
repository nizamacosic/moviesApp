//
//  DetailViewController.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var voteAverageLabel: UILabel!
    
    // MARK: -Class properties
    var titleString:String!
    var dateString:String!
    var overviewString:String!
    var voteDouble:Double!
    var imageString:String?
    
    // MARK: -UIViewController events
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.load(url: Constants.API.urlImageBase + imageString!)
        titleLabel.text = titleString
        dateLabel.text = Constants.Content.releaseDateLabelText + dateString
        overviewLabel.text = Constants.Content.overviewLabelText + overviewString
        voteAverageLabel.text = Constants.Content.voteAverageLabelText + "\(voteDouble!)"
    }
}
