//
//  FavoritesHeaderCollectionView.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/17/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class FavoritesHeaderCollectionView: UICollectionReusableView {
    
    static let identifier = "FavoritesHeaderIdentifier"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "No Favorite Recipes"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    public func configure() {
        addSubview(label)
        backgroundColor = .coolGrey
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
