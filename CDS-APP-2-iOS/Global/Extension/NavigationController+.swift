//
//  NavigationController+.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

extension UINavigationController {
    
    //MARK: setting NavigationBar Background Color
    
    func setBackgroundColor() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
    
    //MARK: setting Center Item in NavigationBar
    
    func setCenterItem() {
        let title = UILabel()
        let detailDownImage = UIImageView(image: ImageLiterals.icon.icDetailDownBlackSmall)
        
        title.do {
            $0.text = "모자"
            $0.font = UIFont.krBold(ofSize: 18.adjusted)
        }
        detailDownImage.do {
            $0.contentMode = .scaleAspectFit
        }
        
        let stackView = UIStackView(arrangedSubviews: [title, detailDownImage])
        stackView.spacing = 4.adjusted
        topViewController?.navigationItem.titleView = stackView
    }
    
    //MARK: setting left and right Button Item in NavigationBar
    
    func setButtonItem() {
        let searchButtonImage = ImageLiterals.icon.icSearchBlack.withRenderingMode(.alwaysOriginal)
        let cartButtonImage = ImageLiterals.icon.icCartBlack.withRenderingMode(.alwaysOriginal)
        
        let searchButton = UIBarButtonItem(image: searchButtonImage, style: .plain, target: nil, action: nil)
        let cartButton = UIBarButtonItem(image: cartButtonImage, style: .plain, target: nil, action: nil)
        topViewController?.navigationItem.rightBarButtonItems = [searchButton, cartButton]
    }
}
