//
//  RecipeInstructionsCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/6/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class RecipeInstructionsCell: UITableViewCell {
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var meal: Meal! {
        didSet {
            instructionsLabel.text = meal.strInstructions
        }
    }
}
