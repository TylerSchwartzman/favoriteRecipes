//
//  RecipeDetailsController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class RecipeDetailsController: UITableViewController {
    
    let favoritesButton = UIImage(named: "favorites")
    let favoritedButton = UIImage(named: "favorited")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavBar()
    }
    
    var meal: Meal! {
        didSet {
            navigationItem.title = meal.strMeal
            fetchRecipeIngredients()
        }
    }
    
    var ingredients = [String]()
    var measurements = [String]()
    
    //MARK:- Setup Work
    
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    let cellId3 = "cellId3"

    fileprivate func setupTableView() {
        let nib1 = UINib(nibName: "RecipeInstructionsCell", bundle: nil)
        let nib2 = UINib(nibName: "IngredientsCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: cellId1)
        tableView.register(nib2, forCellReuseIdentifier: cellId2)
        tableView.register(MealImageCell.self, forCellReuseIdentifier: cellId3)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        tableView.backgroundColor = .coolGrey
    }
    
    fileprivate func fetchRecipeIngredients() {
        ingredients.append(contentsOf: meal.getIngredientsList())
        measurements.append(contentsOf: meal.getMeasurementsList())
    }
    
    fileprivate func setupNavBar() {
        
        let favoriteButton = UIBarButtonItem()
        favoriteButton.image = favoritesButton
        favoriteButton.tintColor = .burntOrange
        favoriteButton.target = self
        favoriteButton.action = #selector(tappedFavoritesButton)
        
        let favoritedTapped = UIBarButtonItem()
        favoritedTapped.image = favoritedButton
        favoritedTapped.tintColor = .burntOrange
        favoritedTapped.target = self
        favoritedTapped.action = nil
        
        let savedMeals = UserDefaults.standard.savedMeals()
        let hasFavorited = savedMeals.firstIndex(where: { $0.strMeal == self.meal?.strMeal }) != nil
        if hasFavorited {
            navigationItem.rightBarButtonItem = favoritedTapped
        } else {
            navigationItem.rightBarButtonItem = favoriteButton
        }
    }
    
    @objc fileprivate func tappedFavoritesButton() {
        
        guard let meal = self.meal else { return }
        
        var favoriteMeals = UserDefaults.standard.savedMeals()
        favoriteMeals.append(meal)
    
        let data = NSKeyedArchiver.archivedData(withRootObject: favoriteMeals)
       
        UserDefaults.standard.set(data, forKey: UserDefaults.favoriteMealKey)
        
        showBadgeHighlight()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: favoritedButton, style: .plain, target: self , action: nil)
    }
    
    fileprivate func showBadgeHighlight() {
        UIApplication.mainTabBarController()?.viewControllers?[1].tabBarItem.badgeValue = "New"
    }
    
}
