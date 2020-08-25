//
//  UserDefaults.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/18/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let favoriteMealKey = "favoriteMealKey"
    
    func savedMeals() -> [Meal] {
        
        // fetch saved meals
        guard let savedMealData = UserDefaults.standard.data(forKey: UserDefaults.favoriteMealKey) else { return [] }
        guard let savedMeals = NSKeyedUnarchiver.unarchiveObject(with: savedMealData) as? [Meal] else { return [] }
        return savedMeals
    }
    
    func deleteMeal(meal: Meal) {
         let meals = savedMeals()
         let filteredMeals = meals.filter { (singleMeal) -> Bool in
             return singleMeal.strMeal != meal.strMeal && singleMeal.strArea != meal.strArea
         }
         let data = NSKeyedArchiver.archivedData(withRootObject: filteredMeals)
         UserDefaults.standard.set(data, forKey: UserDefaults.favoriteMealKey)
     }
}
