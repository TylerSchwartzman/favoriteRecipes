//
//  DetailsVC+TableView.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/9/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

extension RecipeDetailsController {
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = IndentedLabel()
        
        if section == 1 {
            label.text = "Ingredients"
        } else if section == 2 {
            label.text = "Instructions"
        }
        
        label.backgroundColor = .coolGrey
        label.textColor = .white
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
