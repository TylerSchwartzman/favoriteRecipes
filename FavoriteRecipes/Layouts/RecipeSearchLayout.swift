//
//  RecipeSearchLayout.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/31/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class RecipeSearchLayout: UICollectionViewFlowLayout {
    
    var cache: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        cache.removeAll()
    }
    
    
    
}
