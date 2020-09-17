//
//  FavoritesVC+CollectionView.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/9/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

extension FavoritesController: UICollectionViewDelegateFlowLayout {
    
    //MARK:- UICollection View Delegate / Spacing Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MealCollectionViewCell
        
        cell.meal = self.meals[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FavoritesHeaderCollectionView.identifier, for: indexPath) as! FavoritesHeaderCollectionView
        
        headerView.configure()
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return self.meals.isEmpty == true ? CGSize(width: view.frame.size.width, height: 250) : CGSize(width: view.frame.size.width, height: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsController()
        recipeDetailsVC.meal = self.meals[indexPath.item]
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 16) / 2
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
