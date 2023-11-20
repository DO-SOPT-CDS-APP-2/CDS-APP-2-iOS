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
    private let dummy = Category.dummy()
    
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
        originView.horizontalCollectionView.delegate = self
        originView.horizontalCollectionView.dataSource = self
    }
    
    private func setRegister() {
        
    }
    
    private func setAddTarget() {
        
    }
   
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainWeatherCollectionViewCell.className, for: indexPath) as? MainWeatherCollectionViewCell else { return UICollectionViewCell() }
//                cell.configureCell() = self
//                return cell
//    }
    
}

