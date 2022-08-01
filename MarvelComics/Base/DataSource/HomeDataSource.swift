//
//  HomeDataSource.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    var updateUI:((Error?) -> Void)?
    var comicDataSource: ComicBaseData?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comicDataSource?.dataSource?.comics?.count ?? 0
    }
    
    //Fetch data and update UI
    func fetchData() {
        let request = RequestHandler().getComics()
        JSONDecoder().decoderWithRequest(ComicBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
            if error != nil {
                print("error is not nil!")
                self?.updateUI?(error!)
            } else {
                print("result!")
                self?.comicDataSource = result
                self?.updateUI?(error)
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comicCell, for: indexPath) as! ComicCollectionViewCell
        let comic = comicDataSource?.dataSource?.comics?[indexPath.item]
        cell.setData(comic: comic)
        
        return cell
    }
    
}
