//
//  CategoryViewController.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class CategoryViewController: UIViewController {

    private let originView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setHierachy()
        setLayout()
        setDelegate()
        setRegister()
        setAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setHierachy() {
        self.view.addSubview(originView)
    }
    
    private func setLayout() {
        originView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(154.adjusted)
        }
    }
    
    private func setDelegate() {
        
    }
    
    private func setRegister() {
        
    }
    
    private func setAddTarget() {
        
    }
   
}

