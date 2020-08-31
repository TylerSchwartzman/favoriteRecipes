//
//  RecipeSearchLayout.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/28/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class RecipeSearchLayout: UICollectionViewFlowLayout {
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        cache.removeAll()
    }
    
}

