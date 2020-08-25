//
//  MealImageCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/12/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import SDWebImage

class MealImageCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    
}
extension MealImageCell {
    
    func configure (with meal: Meal) {
        guard let url = URL(string: meal.strMealThumb ?? "") else { return }
        
        mealImage.sd_setImage(with: url, completed: nil)
        mealImage.layer.cornerRadius = 20
    }
}

