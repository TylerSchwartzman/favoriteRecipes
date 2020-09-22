//
//  RecipeSearch+CollectionView.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/9/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

extension RecipeSearchController: UICollectionViewDelegateFlowLayout {
    
    //MARK:- UICollection View Delegate / Spacing Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCollectionViewCell.reuseID, for: indexPath) as! MealCollectionViewCell
        let meal = self.meals[indexPath.row]
        cell.meal = meal
        
        return cell
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
    
    //MARK: UICollectionView Supplementary Views
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MealSearchFooterView.identifier, for: indexPath) as! MealSearchFooterView
            
            return footerView
            
        } else {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderCollectionView.identifier, for: indexPath) as! SearchHeaderCollectionView
            
            headerView.configure()
            
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == true ? CGSize(width: view.frame.size.width, height: 250) : CGSize(width: view.frame.size.width, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == false ? CGSize(width: view.frame.size.width, height: 200) : CGSize(width: view.frame.size.width, height: 0)
    }
    
}
