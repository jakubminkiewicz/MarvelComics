//
//  ViewController.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    let presentation = HomeViewPresentation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarStyling()
        setup()
    }
    
    fileprivate func setup() {
        presentation.controller = self
        presentation.displayLayout()
    }
    
    fileprivate func navBarStyling() {
        navigationController?.applyStyling(titleNavBar: "MARVEL COMICS", controller: self, shouldShowButton: false)
    }

    
}

