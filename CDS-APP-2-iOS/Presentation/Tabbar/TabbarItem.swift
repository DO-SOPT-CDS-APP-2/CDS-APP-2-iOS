//
//  TabbarItem.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

enum TabbarItem: CaseIterable {
    case home
    case category
    case search
    case like
    case my
    
    var icon: UIImage {
        switch self {
        case .home: return ImageLiterals.icon.icHomeOff
        case .category: return ImageLiterals.icon.icCategoryOff
        case .search: return ImageLiterals.icon.icSearch
        case .like: return ImageLiterals.icon.icLikeOff
        case .my: return ImageLiterals.icon.icMyOff
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home: return ImageLiterals.icon.icHomeOn
        case .category: return ImageLiterals.icon.icCategoryOn
        case .search: return ImageLiterals.icon.icSearch
        case .like: return ImageLiterals.icon.icLikeOn
        case .my: return ImageLiterals.icon.icMyOn
        }
    }
    
    var description: String {
        switch self {
        case .home: return StringLiterals.Tabbar.title.home
        case .category: return StringLiterals.Tabbar.title.category
        case .search: return StringLiterals.Tabbar.title.search
        case .like: return StringLiterals.Tabbar.title.like
        case .my: return StringLiterals.Tabbar.title.my
        }
    }
    
    var targetViewController: UIViewController? {
        switch self {
        case .home: return HomeViewController()
        case .category: return CategoryViewController()
        case .search: return nil
        case .like: return nil
        case .my: return nil
        }
    }
}
