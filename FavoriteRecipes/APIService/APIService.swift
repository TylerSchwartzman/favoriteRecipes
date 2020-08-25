//
//  APIService.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseMealSearchURL = "https://www.themealdb.com/api/json/v1/1/search.php"
    
    static let share = APIService()
    
    func fetchMeals(searchText: String, completionHandler: @escaping ([Meal]) -> ()) {
        
        let parameters = ["s": searchText]
        
        AF.request(baseMealSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact API", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(searchResults.self, from: data)
                completionHandler(searchResult.meals)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    struct searchResults: Decodable {
        let meals: [Meal]
    }
}
