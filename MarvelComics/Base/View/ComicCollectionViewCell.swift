//
//  ComicCollectionViewCell.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit
import SDWebImage

class ComicCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var comicImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.darkGray.cgColor
        return image
    }()
    
    
    fileprivate func setupCell() {
        
        contentView.addSubview(comicImage)
        comicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        comicImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        comicImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        comicImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        
    }
    
    func setData(comic: Comic?){
        guard let path = comic?.thumbnail?.path, let ext = comic?.thumbnail?.ext else { return }
        let url = path + "." + ext
        comicImage.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .continueInBackground, context: nil)
    }
    
    
}
