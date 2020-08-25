//
//  MealCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import SDWebImage

class MealCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealCategoryLabel: UILabel!
    @IBOutlet weak var mealRegionLabel: UILabel!
    
    
    var meal: Meal! {
        didSet {
            mealNameLabel.text = meal.strMeal
            mealCategoryLabel.text = meal.strCategory
            mealRegionLabel.text = meal.strArea
            
            guard let url = URL(string: meal.strMealThumb ?? "") else { return }
            
            mealImage.sd_setImage(with: url, completed: nil)
            mealImage.layer.cornerRadius = 10
        }
    }
}
