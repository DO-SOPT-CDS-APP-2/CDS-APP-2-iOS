//
//  HatDetailViewController.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class HatDetailViewController: UIViewController {
    
    private let detailcollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupNavigationBar()
        setupCollectionView()
        setHierachy()
        setUI()
        setLayout()
        setDelegate()
        configureColletionView()
    }
    
    // MARK: - Set NavigationBar
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        
        let home = UIBarButtonItem(image: ImageLiterals.icon.icHomeBlack, style: .plain, target: nil, action: nil)
        let search = UIBarButtonItem(image: ImageLiterals.icon.icSearch, style: .plain, target: nil, action: nil)
        let cart = UIBarButtonItem(image: ImageLiterals.icon.icCartBlack, style: .plain, target: nil, action: nil)

        navigationItem.rightBarButtonItems = [cart, search, home]
        for i in [home, search, cart] {
            i.tintColor = .black
        }
    }
    
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        detailcollectionView.register(MainInfoCollectionViewCell.self, forCellWithReuseIdentifier: MainInfoCollectionViewCell.className)
        detailcollectionView.register(ProductInfoCollectionViewCell.self, forCellWithReuseIdentifier: ProductInfoCollectionViewCell.className)
        detailcollectionView.register(SizeInfoCollectionViewCell.self, forCellWithReuseIdentifier: SizeInfoCollectionViewCell.className)
        detailcollectionView.register(RecommendInfoCollectionViewCell.self, forCellWithReuseIdentifier: RecommendInfoCollectionViewCell.className)
        
        
        
        
        detailcollectionView.register(ProductInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductInfoHeaderCollectionReusableView.className)
        detailcollectionView.register(SizeInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SizeInfoHeaderCollectionReusableView.className)
        detailcollectionView.register(RecommendInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendInfoHeaderCollectionReusableView.className)

    }
    
    
    // MARK: - Set UI
    
    private func setUI() {
        detailcollectionView.backgroundColor = .clear
    }
    
    
    // MARK: - Set Layout
    
    private func setLayout() {
        detailcollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        view.addSubview(detailcollectionView)
    }
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        detailcollectionView.delegate = self
        detailcollectionView.dataSource = self
    }
    

    // MARK: - Set CollectionViewFlowLayout
    
    private func configureColletionView() {
        if let layout = detailcollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
    }
}

extension HatDetailViewController: UICollectionViewDelegate {}
extension HatDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 1
        case 2 :
            return 1
        case 3:
            return 1
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainInfoCollectionViewCell.className, for: indexPath) as! MainInfoCollectionViewCell
            return cell
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductInfoCollectionViewCell.className, for: indexPath) as! ProductInfoCollectionViewCell
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeInfoCollectionViewCell.className, for: indexPath) as! SizeInfoCollectionViewCell
            return cell
        }
        else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendInfoCollectionViewCell.className, for: indexPath) as! RecommendInfoCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainInfoCollectionViewCell.className, for: indexPath) as! MainInfoCollectionViewCell
            return cell
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch indexPath.section {
                //case 0은 헤더가 없으므로 생략
            case 1 :
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                       withReuseIdentifier: ProductInfoHeaderCollectionReusableView.className,
                                                                                       for: indexPath) as? ProductInfoHeaderCollectionReusableView
                    else {
                        return ProductInfoHeaderCollectionReusableView()
                    }
                    header.configure()
                    return header
                } else {
                    guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                                       withReuseIdentifier: ProductInfoFooterCollectionReusableView.className,
                                                                                       for: indexPath) as? ProductInfoFooterCollectionReusableView
                    else {
                        return ProductInfoFooterCollectionReusableView()
                    }
                    footer.configure()
                    return footer
                }
            case 2 :
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                       withReuseIdentifier: SizeInfoHeaderCollectionReusableView.className,
                                                                                       for: indexPath) as? SizeInfoHeaderCollectionReusableView
                    else {
                        return SizeInfoHeaderCollectionReusableView()
                    }
                    header.configure()
                    return header
                } else {
                    guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                                       withReuseIdentifier: SizeInfoFooterCollectionReusableView.className,
                                                                                       for: indexPath) as? SizeInfoFooterCollectionReusableView
                    else {
                        return SizeInfoFooterCollectionReusableView()
                    }
                    footer.configure()
                    return footer
                }
            case 3 :
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                   withReuseIdentifier: RecommendInfoHeaderCollectionReusableView.className,
                                                                                   for: indexPath) as? RecommendInfoHeaderCollectionReusableView
                else { return RecommendInfoHeaderCollectionReusableView() }
                header.configure()
                return header

            default :
                return ProductInfoHeaderCollectionReusableView()
            }
        }
        
        // 헤더의 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 1 :
            return CGSize(width: 300, height: 45)
        case 2 :
            return CGSize(width: 300, height: 45)
        case 3 :
            return CGSize(width: 300, height: 45)
        default :
            return CGSize.zero
        }
    }
}

extension HatDetailViewController: UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 900.adjusted)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 980.adjusted)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 340.adjusted)
        case 3:
            return CGSize(width: collectionView.bounds.width, height: 650.adjusted)
        default:
            return CGSize(width: 0.0, height: 0.0)
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView(for: scrollView, inSection: 1)
    }
    
    private func updateHeaderView(for scrollView: UIScrollView, inSection section: Int) {
        
        //헤더 가져오기
        let headerView = detailcollectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader).first as? ProductInfoHeaderCollectionReusableView
        
        // 스크롤 오프셋
        let yOffset = scrollView.contentOffset.y
        
        // 헤더의 y 좌표 업데이트
        let indexPathsForVisibleItems = detailcollectionView.indexPathsForVisibleItems
        let firstVisibleSection = indexPathsForVisibleItems.map({ $0.section }).min()
        if firstVisibleSection == section {
            headerView?.frame.origin.y = max(0, yOffset)
        }
    }
}


