//
//  HatDetailViewController.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

class HatDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
    }
    
    
    // 네비게이션 바 커스텀 설정
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        
        let home = UIBarButtonItem(image: ImageLiterals.icon.icHomeBlack, style: .plain, target: nil, action: nil)
        let search = UIBarButtonItem(image: ImageLiterals.icon.icSearch, style: .plain, target: nil, action: nil)
        let cart = UIBarButtonItem(image: ImageLiterals.icon.icCartBlack, style: .plain, target: nil, action: nil)

        navigationItem.rightBarButtonItems = [cart, search, home]
        for i in [home, search, cart] {
            i.tintColor = .black
        }
    }
    
    
}



