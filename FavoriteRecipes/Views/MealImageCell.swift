//
//  MealImageCell2.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/27/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import SDWebImage

class MealImageCell: UITableViewCell {
    
    var mealImageView = UIImageView()
    var heightConstraint: NSLayoutConstraint!
        
    func configure (with meal: Meal) {
        guard let url = URL(string: meal.strMealThumb ?? "") else { return }
        
        mealImageView.sd_setImage(with: url, completed: nil)
        mealImageView.layer.cornerRadius = 20
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureViews() {
                        
        contentView.addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mealImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mealImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        heightConstraint = mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor)
        
        heightConstraint.priority = UILayoutPriority.init(999)

        heightConstraint.isActive = true
    }
    
}
