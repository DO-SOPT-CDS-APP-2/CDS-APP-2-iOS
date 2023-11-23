//
//  HatCategoryViewController.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class HatCategoryViewController: UIViewController {
    
    //MARK: set Property
    
    private let headerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setNavigationBar()
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    //MARK: set UI
    
    private func setUI() {
        headerCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubview(headerCollectionView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        headerCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88.adjusted) // 이렇게밖에 안된다고 ..??? 수정해봐
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43.adjusted)
        }
    }
    
    //MARK: set NavigationBar
    
    private func setNavigationBar() {
        self.navigationController?.setBackgroundColor()
        self.navigationController?.setButtonItem()
        self.navigationController?.setCenterItem()
    }
}
