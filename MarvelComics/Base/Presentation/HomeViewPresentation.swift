//
//  HomeViewPresentation.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit

class HomeViewPresentation: NSObject, UICollectionViewDelegate {
    
    weak var controller: HomeViewController?
    var dataSource = HomeDataSource()
    
    var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 2
        flow.scrollDirection = .horizontal
        let mainScreen = UIScreen.main.bounds
        flow.itemSize = CGSize(width: mainScreen.width / 2, height: mainScreen.height / 2.5)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    func displayLayout() {
        guard let controller = controller else {return}
        
        controller.view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor).isActive = true
        
        collectionView.register(ComicCollectionViewCell.self, forCellWithReuseIdentifier: comicCell)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        
        dataSource.fetchData()
        dataSource.updateUI = { [weak self] (error) in
            if let weakSelf = self {
                print("We got data and reloaded collec view")
                DispatchQueue.main.async {
                    weakSelf.collectionView.reloadData()
                }
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = dataSource.comicDataSource?.dataSource?.comics?[indexPath.item]
        let detailView = DetailViewController()
        detailView.comic = comic
        controller?.navigationController?.pushViewController(detailView, animated: true)
        print(indexPath.item)
    }
}
