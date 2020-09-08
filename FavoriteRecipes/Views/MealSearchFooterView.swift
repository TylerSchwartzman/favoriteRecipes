//
//  MealSearchView.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class MealSearchFooterView: UICollectionReusableView {
    
    static let identifier = "FooterIdentifier"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchingLabel: UILabel!
    
}
