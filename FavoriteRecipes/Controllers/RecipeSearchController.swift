//
//  SearchController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/27/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import Alamofire

class RecipeSearchController: UICollectionViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchBar()
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .offWhite
    }
    
    private func showError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    let nib = UINib(nibName: "MealSearchFooterView", bundle: nil)
    fileprivate let layout = CollectionViewFlowLayout()

    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .coolGrey
        
        collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: MealCollectionViewCell.reuseID)
        
        collectionView.register(SearchHeaderCollectionView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SearchHeaderCollectionView.identifier)
        
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,                                      withReuseIdentifier: MealSearchFooterView.identifier)
        
        collectionView.collectionViewLayout = layout
    }
    
}
