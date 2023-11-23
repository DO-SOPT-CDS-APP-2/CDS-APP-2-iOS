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
    
    private let headerDummy = HeaderCategory.headerDummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setNavigationBar()
        self.setUI()
        self.setHierachy()
        self.setLayout()
        
        self.setHeaderCollectionViewConfig()
        self.setCollectionViewLayout()
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
            $0.top.equalToSuperview().inset(88.adjusted) // 이렇게밖에 안된다고 ..??? 좀따가 수정해보자
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
    
    private func setHeaderCollectionViewConfig() {
        self.headerCollectionView.register(HeaderCollectionViewCell.self,
                                           forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        self.headerCollectionView.delegate = self
        self.headerCollectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 9
        self.headerCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

extension HatCategoryViewController: UICollectionViewDelegate {}

extension HatCategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier,
                                                            for: indexPath) as? HeaderCollectionViewCell else { return UICollectionViewCell() }
        
        item.bindData(category: headerDummy[indexPath.row].label)
        return item
    }
}
