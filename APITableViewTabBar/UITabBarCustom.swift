//
//  UITabBarCustom.swift
//  APITableViewTabBar
//
//  Created by DAM on 21/12/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit

class UITabBarCustom: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //8F9294 color not selected
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)

        tabBarItem = self.tabBar.items?[0]
        tabBarItem.image = UIImage(named: "pokedexWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "pokedexBlack")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items?[1]
        tabBarItem.image = UIImage(named: "homeWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "homeBlack")?.withRenderingMode(.alwaysOriginal)
       
        
        tabBarItem = self.tabBar.items?[2]
        tabBarItem.image = UIImage(named: "accountWhite")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "accountBlack")?.withRenderingMode(.alwaysOriginal)
      
        for index in 0...tabBar.items!.count - 1{
            tabBarItem = self.tabBar.items?[index]
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        self.selectedIndex = 1

    }
}
