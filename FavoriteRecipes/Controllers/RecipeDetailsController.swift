//
//  RecipeDetailsController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = rect.inset(by: insets)
        super.drawText(in: customRect)
    }
}

class RecipeDetailsController: UITableViewController {
    
    let favoritesButton = UIImage(named: "favorites")
    let favoritedButton = UIImage(named: "favorited")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavBarButtons()
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
    
    fileprivate let cellId1 = "cellId1"
    fileprivate let cellId2 = "cellId2"
    fileprivate let cellId3 = "cellId3"

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
    
    fileprivate func setupNavBarButtons() {
        
        let savedMeals = UserDefaults.standard.savedMeals()
        let hasFavorited = savedMeals.firstIndex(where: { $0.strMeal == self.meal?.strMeal }) != nil
        if hasFavorited {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: favoritedButton, style: .plain, target: self , action: nil)
        } else {
            navigationItem.rightBarButtonItem =
                UIBarButtonItem(image: favoritesButton, style: .plain, target: self , action: #selector(tappedFavoritesButton))
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
    
    @objc fileprivate func fetchFavoriteMeal() {
        
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.favoriteMealKey) else { return }
        
        let savedMeals = NSKeyedUnarchiver.unarchiveObject (with: data) as? [Meal]
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = IndentedLabel()
        if section == 1 {
            label.text = "Ingredients"
        } else if section == 2 {
            label.text = "Instructions"
        }
        
        label.backgroundColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return ingredients.count
        } else {
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! MealImageCell
            cell.configure(with: meal)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! IngredientsCell
            let ingredient = self.ingredients[indexPath.row]
            let measurement = self.measurements[indexPath.row]
            cell.ingredientLabel.text = ingredient
            cell.measurementLabel.text = measurement
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1, for: indexPath) as! RecipeInstructionsCell
            cell.instructionsLabel.text = meal.strInstructions
            cell.textLabel?.numberOfLines = 0
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
