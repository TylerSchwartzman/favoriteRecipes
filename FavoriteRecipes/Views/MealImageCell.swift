//
//  MealImageCell2.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/27/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import SDWebImage

class MealImageCell2: UITableViewCell {
        
    var meal: Meal! {
        didSet {
            guard let url = URL(string: meal.strMealThumb ?? "") else { return }
            imageView1.sd_setImage(with: url, completed: nil)
        }
    }
    
    var imageView1 = UIImageView(image: placeholder)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureViews() {
        imageView1.heightAnchor.constraint(equalTo: imageView1.widthAnchor).isActive = true
                        
        contentView.addSubview(imageView1)
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
