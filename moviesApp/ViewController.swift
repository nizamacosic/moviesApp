//
//  ViewController.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    // MARK: -IBOutlets
    @IBOutlet var collection: UICollectionView!
    
    //MARK: -Class properties
    var movies: Movies!
    
    //MARK: -UIViewController events
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        collection.delegate = self
        collection.dataSource = self
        
        
        // MARK: -Fetching data from API
        NetworkService.shared.getData { (response) in
            self.movies = response
            self.collection.reloadData()
        }
        //getData()
    }
    
    @objc func deleteMovies() {
        var moviesIndex = [Int]()
        
        for item in 0..<movies.results.count {
            if movies.results[item].selected {
                moviesIndex.append(item)
            }
        }
        let reversed = Array(moviesIndex.sorted().reversed())
        
        for item in reversed {
            print(movies.results[item].title)
            movies.results.remove(at: item)
        }
        collection.reloadData()
    }
    
    //MARK: -ViewContoller and UICollectionView layout setup
    func setLayout() {
        collection.allowsMultipleSelection = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteMovies))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-12, height: (view.frame.size.width/2)+50)
        
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collection.frame = .zero
        collection.collectionViewLayout = layout
    }
}

// MARK: -UICollectionView Datasource extension
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (movies != nil) {
            return movies.results.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.MoviesCollectionViewCellIdentifiers, for: indexPath) as! MoviesCollectionViewCell
        cell.delegate = self
        cell.setup(with: movies.results[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: Constants.Identifiers.DetailViewControllerIdentifier) as! DetailViewController
        
        vc.titleString = movies.results[indexPath.row].title
        vc.dateString = movies.results[indexPath.row].releaseDate
        vc.voteDouble = movies.results[indexPath.row].voteAverage
        vc.overviewString = movies.results[indexPath.row].overview
        vc.imageString = movies.results[indexPath.row].posterPath
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: -Extension for selected UICollectionView cells
extension ViewController: MoviesCollectionViewCellDelegate {
    func selectedCell(cell: MoviesCollectionViewCell) {
        guard let indexPath = self.collection.indexPath(for: cell) else {
            return
        }
        movies.results[indexPath.row].selected = !movies.results[indexPath.row].selected
        collection.reloadItems(at: [indexPath])
    }
}
