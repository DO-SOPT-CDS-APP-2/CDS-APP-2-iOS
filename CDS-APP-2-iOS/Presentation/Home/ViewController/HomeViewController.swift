//
//  ViewController.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let homeTopView = HomeTopView()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierachy()
        setLayout()
    }

    // MARK: - Functions
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setHierachy() {
        self.view.addSubviews(homeTopView)
    }
        
    private func setLayout() {
        homeTopView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            
        }
    }
}
