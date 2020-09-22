//
//  IngredientsCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/7/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {
    
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    var meal: Meal! {
        didSet {
            guard let meal = meal else { return }
            
            measurementLabel.text = meal.strMeasure1
            ingredientLabel.text = meal.strIngredient1
        }
    }
}
