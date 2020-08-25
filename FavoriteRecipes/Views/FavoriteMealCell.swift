//
//  FavoriteMealCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/15/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

let placeholder = UIImage(named: "favorites")

class FavoriteMealCell: UICollectionViewCell {
    
    var meal: Meal! {
        didSet {
            mealNameLabel.text = meal.strMeal
            regionLabel.text = meal.strArea
            
            let url = URL(string: meal.strMealThumb ?? "")
            imageView.sd_setImage(with: url)
        }
    }
    
    let imageView = UIImageView(image: placeholder)
    let mealNameLabel = UILabel()
    let regionLabel = UILabel()
    
    fileprivate func stylizeLabel() {
        mealNameLabel.text = "Meal Name"
        mealNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        regionLabel.text = "Region"
        regionLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    fileprivate func configureViews() {
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageView, mealNameLabel, regionLabel])
        
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stylizeLabel()
        
        configureViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
