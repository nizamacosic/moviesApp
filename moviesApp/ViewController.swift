//
//  ViewController.swift
//  moviesApp
//
//  Created by MBP on 17/03/2021.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var movies: Movies!
    
    @IBOutlet var collection: UICollectionView!
    var selectedItemsAtIndex = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        collection.delegate = self
        collection.dataSource = self
        
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        
        AF.request(Constants.API.apiUrl + Constants.API.apiKey).responseDecodable(of: Movies.self) {
            response in
            self.movies = response.value
            self.collection.reloadData()
        }
    }
    
    @objc func deleteMovies() {
        
        for item in 0..<selectedItemsAtIndex.count {
            
            print(movies.results[selectedItemsAtIndex[item].row].title)
            let indexRow = selectedItemsAtIndex[item].row
            movies.results.remove(at: indexRow)
            
            //print(selectedItemsAtIndex)
            for i in item+1..<selectedItemsAtIndex.count {
                selectedItemsAtIndex[i].row -= 1
                
            }
            print(selectedItemsAtIndex)
            
        }
        
        collection.reloadData()
        selectedItemsAtIndex.removeAll()
    }
    
    func setLayout() {
        
        //
        collection.allowsMultipleSelection = true
        //
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteMovies))
        
        // MARK: CollectionView layout
        
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
        var isActive = false
        for i in selectedItemsAtIndex {
            if i == indexPath {
                isActive = true
                break
            }
        }
        cell.setup(with: movies.results[indexPath.row], active: isActive)
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
//
extension ViewController: MoviesCollectionViewCellDelegate {
    func selectedCell(cell: MoviesCollectionViewCell) {
        guard let indexPath = self.collection.indexPath(for: cell) else {
            return
        }
        var inIndex: Bool = false
        
        for i in 0..<selectedItemsAtIndex.count {
            if selectedItemsAtIndex[i] == indexPath {
                inIndex = true
                selectedItemsAtIndex.remove(at: i) //
                cell.selectButton.setImage(UIImage(named: "unselected"), for: .normal)
                cell.selectButton.changeButtonColor(.lightGray)
                break
            }
            else {
                inIndex = false
                cell.selectButton.setImage(UIImage(named: "selected"), for: .normal)
                cell.selectButton.changeButtonColor(.lightGray)
            }
        }
        
        if !(inIndex) {
            selectedItemsAtIndex.append(indexPath)
            cell.selectButton.setImage(UIImage(named: "selected"), for: .normal)
            cell.selectButton.changeButtonColor(.lightGray)
        }
        print(selectedItemsAtIndex)
        
    }
}
