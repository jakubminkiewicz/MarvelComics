//
//  DetailViewController.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var comic: Comic?
    
    // presenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        
        let comicTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        comicTitle.center = CGPoint(x: 160, y: 285)
        comicTitle.textAlignment = .center
        comicTitle.text = comic?.title
        self.view.addSubview(comicTitle)
        
        let comicDesc = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        comicDesc.center = CGPoint(x: 160, y: 400)
        comicDesc.textAlignment = .center
        comicDesc.text = comic?.description ?? "This comic does not have a description."
        self.view.addSubview(comicDesc)
        comicDesc.numberOfLines = 0
        
    }
    
    func setBackground(){
        let background = UIImage()
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        let url = (comic?.thumbnail?.path)! + "." + (comic?.thumbnail?.ext)!
        imageView.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .continueInBackground, context: nil)
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
}
