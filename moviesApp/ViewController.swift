//
//  ViewController.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    
    var movies: Movies!
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        collection.delegate = self
        collection.dataSource = self
        
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        
        AF.request(Constants.API.apiURL + Constants.API.apiKey).responseDecodable(of: Movies.self) {
            response in
            self.movies = response.value
            debugPrint(self.movies!)
            self.collection.reloadData()
        }
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-12, height: (view.frame.size.width/2)+50)
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 1
        collection.frame = .zero
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (movies != nil) {
            return movies.results.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        cell.setup(with: movies.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "details") as! DetailViewController
       
        vc.titleString = movies.results[indexPath.row].title
        vc.dateString = movies.results[indexPath.row].releaseDate
        vc.voteDouble = movies.results[indexPath.row].voteAverage
        vc.overviewString = movies.results[indexPath.row].overview
        vc.imageString = movies.results[indexPath.row].posterPath
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

