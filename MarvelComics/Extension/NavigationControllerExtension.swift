//
//  NavigationControllerExtension.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import UIKit

extension UINavigationController {
    
    func applyStyling(titleNavBar: String, controller: UIViewController, shouldShowButton: Bool) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        
        
        let title = UILabel()
        title.text = titleNavBar
        title.textColor = .white
        title.font = UIFont(name: fontStyle, size: navBarFontSize)
        
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
    }
}
