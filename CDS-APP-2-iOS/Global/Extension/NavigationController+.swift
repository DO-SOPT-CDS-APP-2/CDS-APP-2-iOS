//
//  NavigationController+.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

extension UINavigationController {
    
    func setBackgroundColor() {
        let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            
            navigationBar.standardAppearance = appearance;
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
}
