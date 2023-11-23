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
    
    // MARK: - Properties
    
    private let headerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let headerDummy = HeaderCategory.headerDummy()
    
    // MARK: - Life Cycle
    
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
    
    // MARK: - Set UI
    
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
    
    // MARK: - Set Layout
    
    private func setLayout() {
        headerCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88.adjusted) // 이렇게밖에 안된다고 ..??? 좀따가 수정해보자
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43.adjusted)
        }
    }
    
    // MARK: - Methods
    
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

// MARK: - Extension

extension HatCategoryViewController: UICollectionViewDelegateFlowLayout {
    // cell width: text 길이에 따른 동적 너비 적용
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let text = headerDummy[indexPath.item].label
        let font = UIFont.krMedium(ofSize: 14.adjusted)
        let textWidth = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: font]).width
        
        let cellWidth = textWidth + 18
        
        return CGSize(width: cellWidth, height: 43.adjusted)
    }
}

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
