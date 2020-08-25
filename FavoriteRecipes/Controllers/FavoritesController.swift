//
//  Favorites.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class FavoritesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    fileprivate let cellId = "cellId"
    
    var meals = UserDefaults.standard.savedMeals()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        meals = UserDefaults.standard.savedMeals()
        collectionView.reloadData()
        UIApplication.mainTabBarController()?.viewControllers?[1].tabBarItem.badgeValue = nil
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(FavoriteMealCell.self, forCellWithReuseIdentifier: cellId)
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        collectionView.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        
        let location = gesture.location(in: collectionView)
        
        guard let selectedIndexPath = collectionView.indexPathForItem(at: location) else { return }
        
        let alertController = UIAlertController(title: "Remove Meal?", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { (_) in
            let selectedMeal = self.meals[selectedIndexPath.item]
            self.meals.remove(at: selectedIndexPath.item)
            self.collectionView.deleteItems(at: [selectedIndexPath])
            UserDefaults.standard.deleteMeal(meal: selectedMeal)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    //MARK:- UICollection View Delegate / Spacing Methods 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoriteMealCell
        
        cell.meal = self.meals[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsController()
        recipeDetailsVC.meal = self.meals[indexPath.item]
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 16) / 2
        
        return CGSize(width: width, height: width + 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
