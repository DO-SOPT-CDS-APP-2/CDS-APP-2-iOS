//
//  TabbarController.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

final class TabbarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
        self.addTabBarController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
  
    // MARK: - Set UI
    
    private func setUI() {
        self.view.backgroundColor = .white
        tabBar.backgroundColor = .background
    }
    
    // MARK: - Methods
    
    private func addTabBarController() {
        var tabNavigationControllers = [UINavigationController]()
        
        for item in TabbarItem.allCases {
            let tabNavController = createTabNavigationController(
                title: item.description,
                image: item.icon,
                selectedImage: item.selectedIcon,
                viewController: item.targetViewController
            )
            tabNavigationControllers.append(tabNavController)
        }
        
        setViewControllers(tabNavigationControllers, animated: false)
    }
    
    private func createTabNavigationController(title: String, image: UIImage, selectedImage: UIImage, viewController: UIViewController?) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        
        let tabbarItem = UITabBarItem(
            title: title,
            image: image.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage.withRenderingMode(.alwaysOriginal)
        )
        
        // title이 선택되지 않았을 때 폰트, 색상 설정
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.enDisplayMedium(ofSize: 8.adjusted),
            .foregroundColor: UIColor.darkGray
        ]
        
        // title이 선택되었을 때 폰트, 색상 설정
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.enDisplayBold(ofSize: 8.adjusted),
            .foregroundColor: UIColor.black
        ]
        
        tabbarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        tabbarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        tabNavigationController.tabBarItem = tabbarItem
        if let viewController = viewController {
                tabNavigationController.viewControllers = [viewController]
            }
        return tabNavigationController
    }
}

