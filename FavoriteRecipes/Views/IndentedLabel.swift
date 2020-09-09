//
//  IndentedLabel.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 9/9/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = rect.inset(by: insets)
        super.drawText(in: customRect)
    }
}
