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
        coder.encode(strIngredient3 ?? "", forKey: "ingredient3Key")
        coder.encode(strIngredient4 ?? "", forKey: "ingredient4Key")
        coder.encode(strIngredient5 ?? "", forKey: "ingredient5Key")
        coder.encode(strIngredient6 ?? "", forKey: "ingredient6Key")
        coder.encode(strIngredient7 ?? "", forKey: "ingredient7Key")
        coder.encode(strIngredient8 ?? "", forKey: "ingredient8Key")
        coder.encode(strIngredient9 ?? "", forKey: "ingredient9Key")
        coder.encode(strIngredient10 ?? "", forKey: "ingredient10Key")
        coder.encode(strIngredient11 ?? "", forKey: "ingredient11Key")
        coder.encode(strIngredient12 ?? "", forKey: "ingredient12Key")
        coder.encode(strIngredient13 ?? "", forKey: "ingredient13Key")
        coder.encode(strIngredient14 ?? "", forKey: "ingredient14Key")
        coder.encode(strIngredient15 ?? "", forKey: "ingredient15Key")
        coder.encode(strIngredient16 ?? "", forKey: "ingredient16Key")
        coder.encode(strIngredient17 ?? "", forKey: "ingredient17Key")
        coder.encode(strIngredient18 ?? "", forKey: "ingredient18Key")
        coder.encode(strIngredient19 ?? "", forKey: "ingredient19Key")
        coder.encode(strIngredient20 ?? "", forKey: "ingredient20Key")
        
        coder.encode(strMeasure1 ?? "", forKey: "measurement1Key")
        coder.encode(strMeasure2 ?? "", forKey: "measurement2Key")
        coder.encode(strMeasure3 ?? "", forKey: "measurement3Key")
        coder.encode(strMeasure4 ?? "", forKey: "measurement4Key")
        coder.encode(strMeasure5 ?? "", forKey: "measurement5Key")
        coder.encode(strMeasure6 ?? "", forKey: "measurement6Key")
        coder.encode(strMeasure7 ?? "", forKey: "measurement7Key")
        coder.encode(strMeasure8 ?? "", forKey: "measurement8Key")
        coder.encode(strMeasure9 ?? "", forKey: "measurement9Key")
        coder.encode(strMeasure10 ?? "", forKey: "measurement10Key")
        coder.encode(strMeasure11 ?? "", forKey: "measurement11Key")
        coder.encode(strMeasure12 ?? "", forKey: "measurement12Key")
        coder.encode(strMeasure13 ?? "", forKey: "measurement13Key")
        coder.encode(strMeasure14 ?? "", forKey: "measurement14Key")
        coder.encode(strMeasure15 ?? "", forKey: "measurement15Key")
        coder.encode(strMeasure16 ?? "", forKey: "measurement16Key")
        coder.encode(strMeasure17 ?? "", forKey: "measurement17Key")
        coder.encode(strMeasure18 ?? "", forKey: "measurement18Key")
        coder.encode(strMeasure19 ?? "", forKey: "measurement19Key")
        coder.encode(strMeasure20 ?? "", forKey: "measurement20Key")
    }
    
    required init?(coder: NSCoder) {
        self.strMeal = coder.decodeObject(forKey: "mealNameKey") as? String
        self.strArea = coder.decodeObject(forKey: "regionNameKey") as? String
        self.strMealThumb = coder.decodeObject(forKey: "imageKey") as? String
        self.strInstructions = coder.decodeObject(forKey: "instructionsKey") as? String
        self.strIngredient1 = coder.decodeObject(forKey: "ingredient1Key") as? String
        self.strIngredient2 = coder.decodeObject(forKey: "ingredient2Key") as? String
        self.strIngredient3 = coder.decodeObject(forKey: "ingredient3Key") as? String
        self.strIngredient4 = coder.decodeObject(forKey: "ingredient4Key") as? String
        self.strIngredient5 = coder.decodeObject(forKey: "ingredient5Key") as? String
        self.strIngredient6 = coder.decodeObject(forKey: "ingredient6Key") as? String
        self.strIngredient7 = coder.decodeObject(forKey: "ingredient7Key") as? String
        self.strIngredient8 = coder.decodeObject(forKey: "ingredient8Key") as? String
        self.strIngredient9 = coder.decodeObject(forKey: "ingredient9Key") as? String
        self.strIngredient10 = coder.decodeObject(forKey: "ingredient10Key") as? String
        self.strIngredient11 = coder.decodeObject(forKey: "ingredient11Key") as? String
        self.strIngredient12 = coder.decodeObject(forKey: "ingredient12Key") as? String
        self.strIngredient13 = coder.decodeObject(forKey: "ingredient13Key") as? String
        self.strIngredient14 = coder.decodeObject(forKey: "ingredient14Key") as? String
        self.strIngredient15 = coder.decodeObject(forKey: "ingredient15Key") as? String
        self.strIngredient16 = coder.decodeObject(forKey: "ingredient16Key") as? String
        self.strIngredient17 = coder.decodeObject(forKey: "ingredient17Key") as? String
        self.strIngredient18 = coder.decodeObject(forKey: "ingredient18Key") as? String
        self.strIngredient19 = coder.decodeObject(forKey: "ingredient19Key") as? String
        self.strIngredient20 = coder.decodeObject(forKey: "ingredient20Key") as? String
        
        self.strMeasure1 = coder.decodeObject(forKey: "measurement1Key") as? String
        self.strMeasure2 = coder.decodeObject(forKey: "measurement2Key") as? String
        self.strMeasure3 = coder.decodeObject(forKey: "measurement3Key") as? String
        self.strMeasure4 = coder.decodeObject(forKey: "measurement4Key") as? String
        self.strMeasure5 = coder.decodeObject(forKey: "measurement5Key") as? String
        self.strMeasure6 = coder.decodeObject(forKey: "measurement6Key") as? String
        self.strMeasure7 = coder.decodeObject(forKey: "measurement7Key") as? String
        self.strMeasure8 = coder.decodeObject(forKey: "measurement8Key") as? String
        self.strMeasure9 = coder.decodeObject(forKey: "measurement9Key") as? String
        self.strMeasure10 = coder.decodeObject(forKey: "measurement10Key") as? String
        self.strMeasure11 = coder.decodeObject(forKey: "measurement11Key") as? String
        self.strMeasure12 = coder.decodeObject(forKey: "measurement12Key") as? String
        self.strMeasure13 = coder.decodeObject(forKey: "measurement13Key") as? String
        self.strMeasure14 = coder.decodeObject(forKey: "measurement14Key") as? String
        self.strMeasure15 = coder.decodeObject(forKey: "measurement15Key") as? String
        self.strMeasure16 = coder.decodeObject(forKey: "measurement16Key") as? String
        self.strMeasure17 = coder.decodeObject(forKey: "measurement17Key") as? String
        self.strMeasure18 = coder.decodeObject(forKey: "measurement18Key") as? String
        self.strMeasure19 = coder.decodeObject(forKey: "measurement19Key") as? String
        self.strMeasure20 = coder.decodeObject(forKey: "measurement20Key") as? String
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
