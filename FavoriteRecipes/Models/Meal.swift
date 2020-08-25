//
//  Meal.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import Foundation

class Meal: NSObject, Decodable, NSCoding {
    
    func encode(with coder: NSCoder) {
        coder.encode(strMeal ?? "", forKey: "mealNameKey")
        coder.encode(strArea ?? "", forKey: "regionNameKey")
        coder.encode(strMealThumb ?? "", forKey: "imageKey")
        coder.encode(strInstructions ?? "", forKey: "instructionsKey")
        coder.encode(strIngredient1 ?? "", forKey: "ingredient1Key")
        coder.encode(strIngredient2 ?? "", forKey: "ingredient2Key")
        coder.encode(strMeasure1 ?? "", forKey: "measurement1Key")
        coder.encode(strMeasure2 ?? "", forKey: "measurement2Key")
    }
    
    required init?(coder: NSCoder) {
        self.strMeal = coder.decodeObject(forKey: "mealNameKey") as? String
        self.strArea = coder.decodeObject(forKey: "regionNameKey") as? String
        self.strMealThumb = coder.decodeObject(forKey: "imageKey") as? String
        self.strInstructions = coder.decodeObject(forKey: "instructionsKey") as? String
        self.strIngredient1 = coder.decodeObject(forKey: "ingredient1Key") as? String
        self.strIngredient2 = coder.decodeObject(forKey: "ingredient2Key") as? String
        self.strMeasure1 = coder.decodeObject(forKey: "measurement1Key") as? String
        self.strMeasure2 = coder.decodeObject(forKey: "measurement2Key") as? String
    }

    var strMeal: String?
    var strCategory: String?
    var strMealThumb: String?
    var strArea: String?
    var strInstructions: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
}

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


