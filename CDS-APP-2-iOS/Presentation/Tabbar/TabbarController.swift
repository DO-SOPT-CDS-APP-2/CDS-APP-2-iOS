//
//  TabbarController.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

final class TabbarController: UITabBarController {
    
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
    
    private func setUI() {
        self.view.backgroundColor = .white
        tabBar.backgroundColor = .background
    }
    
    private func addTabBarController() {
        var tabNavigationControllers = [UINavigationController]()
        
        for item in TabbarItem.allCases {
            let tabNavController = createTabNavigationController(
                title: item.description,
                image: item.icon,
                selectedImage: item.selectedIcon
            )
            tabNavigationControllers.append(tabNavController)
        }
        
        setViewControllers(tabNavigationControllers, animated: false)
    }
    
    private func createTabNavigationController(title: String, image: UIImage, selectedImage: UIImage) -> UINavigationController {
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
        
        tabNavigationController.viewControllers = [CategoryViewController()] // 여기에 자신의 뷰컨을 넣어서 제대로 나오는 지 확인해보세요! 지금은 모든 탭에서 같은 뷰컨이 나올 것입니다. 나중에 뷰컨 작업이 끝난 후 한번에 연결시킵시다!

        return tabNavigationController
    }
}

