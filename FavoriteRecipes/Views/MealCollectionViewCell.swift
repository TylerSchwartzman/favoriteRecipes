//
//  FavoriteMealCell.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/15/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import SDWebImage

class MealCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stylizeLabel()
        configureViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var meal: Meal! {
        didSet {
            mealNameLabel.text = meal.strMeal
            regionLabel.text = meal.strArea
            
            let url = URL(string: meal.strMealThumb ?? "")
            mealImageView.sd_setImage(with: url)
        }
    }
    
    let mealImageView = UIImageView()
    let imageTint = UIImageView()
    let mealNameLabel = UILabel()
    let regionLabel = UILabel()
    
    fileprivate func stylizeLabel() {
        mealNameLabel.text = "Meal Name"
        mealNameLabel.textColor = .white
        mealNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        mealNameLabel.numberOfLines = 0
        mealNameLabel.textAlignment = .center
        
        regionLabel.text = "Region"
        regionLabel.textColor = .white
        regionLabel.font = UIFont.systemFont(ofSize: 14)
        regionLabel.textAlignment = .center
    }
    
    fileprivate func configureViews() {
        
        mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [mealNameLabel, regionLabel])
        stackView.axis = .vertical
        
        contentView.addSubview(mealImageView)
        mealImageView.layer.cornerRadius = 10
        mealImageView.layer.masksToBounds = true
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mealImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mealImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(imageTint)
        imageTint.backgroundColor = .copperRed
        imageTint.alpha = 0.6
        imageTint.layer.cornerRadius = 10
        imageTint.layer.masksToBounds = true
        imageTint.translatesAutoresizingMaskIntoConstraints = false
        imageTint.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageTint.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageTint.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageTint.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
    }
    
}
