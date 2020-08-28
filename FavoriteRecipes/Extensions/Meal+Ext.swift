//
//  Meal+Ext.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/27/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

extension Meal {
    
    func getIngredientsList() -> [String] {
        
        var ingredients = [String]()
        
        let add = { (ingredient: String?) -> Void in
            guard let ingredient = ingredient,
                !ingredient.isEmpty else { return }
            let stringIngredient = String(ingredient)
            ingredients.append(stringIngredient)
        }
        
        add(strIngredient1)
        add(strIngredient2)
        add(strIngredient3)
        add(strIngredient4)
        add(strIngredient5)
        add(strIngredient6)
        add(strIngredient7)
        add(strIngredient8)
        add(strIngredient9)
        add(strIngredient10)
        add(strIngredient11)
        add(strIngredient12)
        add(strIngredient13)
        add(strIngredient14)
        add(strIngredient15)
        add(strIngredient16)
        add(strIngredient17)
        add(strIngredient18)
        add(strIngredient19)
        add(strIngredient20)
        
        return ingredients
    }
    
    func getMeasurementsList() -> [String] {
        
        var measurements = [String]()
        
        let add = { (measure: String?) -> Void in
            guard let measure = measure,
                !measure.isEmpty else { return }
            let stringMeasurement = String(measure.lowercased())
            measurements.append(stringMeasurement)
        }
        
        add(strMeasure1)
        add(strMeasure2)
        add(strMeasure3)
        add(strMeasure4)
        add(strMeasure5)
        add(strMeasure6)
        add(strMeasure7)
        add(strMeasure8)
        add(strMeasure9)
        add(strMeasure10)
        add(strMeasure11)
        add(strMeasure12)
        add(strMeasure13)
        add(strMeasure14)
        add(strMeasure15)
        add(strMeasure16)
        add(strMeasure17)
        add(strMeasure18)
        add(strMeasure19)
        add(strMeasure20)
        
        return measurements
    }
    
}
