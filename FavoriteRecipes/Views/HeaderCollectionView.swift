//
//  HeaderCollectionReusableVoew.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/8/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {
    
    static let identifier = "HeaderIdentifier"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "No Search Queries"
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
