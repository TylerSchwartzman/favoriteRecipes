//
//  UIApplication.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/20/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static func mainTabBarController() -> MainTabBarController? {
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
    
}
