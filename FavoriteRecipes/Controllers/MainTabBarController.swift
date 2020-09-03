//
//  MainTabBarController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let searchImage = UIImage(named: "search")!
    let favoritesImage = UIImage(named: "favorites")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        setupViewControllers()
    }
    
    //MARK:- Setup Functions
    func setupViewControllers() {
        let layout = UICollectionViewFlowLayout()
        let favoritesController = FavoritesController(collectionViewLayout: layout)
        let searchController = RecipeSearchController(collectionViewLayout: layout)
        
        viewControllers = [
        generateNavigationController(for: searchController, title: "Search", image: searchImage),
        generateNavigationController(for: favoritesController, title: "Favorites", image: favoritesImage)
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }

    
}
