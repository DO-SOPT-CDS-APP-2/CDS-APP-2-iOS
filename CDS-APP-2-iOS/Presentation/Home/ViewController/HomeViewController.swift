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
    
    // MARK: - Properties
    
    private let recommendSmallCellData: [RecommendSmallCellData] = RecommendSmallCellData.recommendSmallCellDummy()
    private let promotionCellData: [PromotionCellData] = PromotionCellData.promotionCellDummy()
    private let productCellData: [ProductCellData] = ProductCellData.productCellDummy()
    private let brandIssueSmallCellData: [ProductCellData] = ProductCellData.brandIssueCellDummy()
    private let brandIssueBigCellData: [UIImage] = [ImageLiterals.img.imgHomeBrand1, ImageLiterals.img.imgHomeBrand2]
    private let popularCellData: [PopularCellData] = PopularCellData.popularCellData()
    private let additionCellData: [PromotionCellData] = PromotionCellData.additionCellDummy()
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFunctions()
    }
    
    // MARK: - Functions
    
    private func setUI() {
        self.view.backgroundColor = .clear
    }
    
    private func setHierachy() {
        self.view.addSubviews(homeView)
    }
    
    private func setLayout() {
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func addFunctions() {
        setUI()
        setHierachy()
        setLayout()
        setRegister()
        setDelegate()
        setNavigation()
    }
    
    private func setRegister() {
        // section 0
        homeView.homeCollectionView.register(HomeCardCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeCardCollectionViewCell.className)
        
        // section 1
        homeView.homeCollectionView.register(HomeRecommendBigCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeRecommendBigCollectionViewCell.className)
        homeView.homeCollectionView.register(HomeRecommendSmallCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeRecommendSmallCollectionViewCell.className)
        
        // section 3
        homeView.homeCollectionView.register(HomePromotionCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomePromotionCollectionViewCell.className)
        homeView.homeCollectionView.register(HomePromotionReusableView.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                             withReuseIdentifier: HomePromotionReusableView.className)
        
        // section 4
        homeView.homeCollectionView.register(HomeProductCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeProductCollectionViewCell.className)
        homeView.homeCollectionView.register(HomeTitleReusableView.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                             withReuseIdentifier: HomeTitleReusableView.className)
        homeView.homeCollectionView.register(HomeSeeAllReusableView.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                             withReuseIdentifier: HomeSeeAllReusableView.className)
        
        // section 5
        homeView.homeCollectionView.register(HomeBrandBigCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeBrandBigCollectionViewCell.className)
        homeView.homeCollectionView.register(HomeBrandSmallCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomeBrandSmallCollectionViewCell.className)
        
        // section 6
        homeView.homeCollectionView.register(HomePopularCollectionViewCell.self,
                                             forCellWithReuseIdentifier: HomePopularCollectionViewCell.className)
        homeView.homeCollectionView.register(HomeChipReusableView.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                             withReuseIdentifier: HomeChipReusableView.className)
        
    }
    
    private func setDelegate() {
        homeView.homeCollectionView.delegate = self
        homeView.homeCollectionView.dataSource = self
    }
    
    private func setNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 2
        case 3:
            return 6
        case 4:
            return 6
        case 5:
            return 12
        case 6:
            return 2
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HomeSection(rawValue: indexPath.section) else {
            print("Wrong Section !")
            return UICollectionViewCell()
        }
        
        switch sectionType {
        case .card:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCardCollectionViewCell.className,
                                                                for: indexPath) as? HomeCardCollectionViewCell else { return UICollectionViewCell() }
            return cell
            
        case .recommend:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendBigCollectionViewCell.className,
                                                                    for: indexPath) as? HomeRecommendBigCollectionViewCell else { return UICollectionViewCell() }
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendSmallCollectionViewCell.className,
                                                                    for: indexPath) as? HomeRecommendSmallCollectionViewCell else { return UICollectionViewCell() }
                cell.configureCell(data: recommendSmallCellData[indexPath.item - 1])
                return cell
            }
            
        case .promotion:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePromotionCollectionViewCell.className,
                                                                for: indexPath) as? HomePromotionCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: promotionCellData[indexPath.item])
            cell.handler = { [weak self] in
                guard let self else { return }
                cell.isTapped.toggle()
            }
            return cell
            
        case .product:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCollectionViewCell.className,
                                                                for: indexPath) as? HomeProductCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: productCellData[indexPath.item])
            cell.handler = { [weak self] in
                guard let self else { return }
                cell.isTapped.toggle()
            }
            return cell
        case .brandIssue:
            switch indexPath.row {
            case 0, 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBrandBigCollectionViewCell.className,
                                                                    for: indexPath) as? HomeBrandBigCollectionViewCell else { return UICollectionViewCell() }
                cell.configureCell(image: brandIssueBigCellData[indexPath.item])
                return cell
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBrandSmallCollectionViewCell.className,
                                                                    for: indexPath) as? HomeBrandSmallCollectionViewCell else { return UICollectionViewCell() }

                cell.configureCell(data: brandIssueSmallCellData[indexPath.item - 2])
                cell.handler = { [weak self] in
                    guard let self else { return }
                    cell.isTapped.toggle()
                }
                return cell
            }
        case .popular:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePopularCollectionViewCell.className,
                                                                for: indexPath) as? HomePopularCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(image: popularCellData[indexPath.row].image)
            return cell
        case .addition:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePromotionCollectionViewCell.className,
                                                                for: indexPath) as? HomePromotionCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: additionCellData[indexPath.item])
            cell.handler = { [weak self] in
                guard let self else { return }
                cell.isTapped.toggle()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomePromotionReusableView.className,
                                                                                   for: indexPath) as? HomePromotionReusableView else { fatalError() }
                header.configureHeader(data: PromotionHeaderData.thirdSectionHeaderData())
                return header
                
            case 3:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomeTitleReusableView.className,
                                                                                   for: indexPath) as? HomeTitleReusableView else { fatalError() }
                header.configureHeader(data: StringLiterals.Home.fourthSection.header)
                return header
                
            case 4:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomeTitleReusableView.className,
                                                                                   for: indexPath) as? HomeTitleReusableView else { fatalError() }
                header.configureHeader(data: StringLiterals.Home.fifthSection.header)
                return header
            case 5:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomeChipReusableView.className,
                                                                                   for: indexPath) as? HomeChipReusableView else { fatalError() }
                return header
                
            case 6:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomePromotionReusableView.className,
                                                                                   for: indexPath) as? HomePromotionReusableView else { fatalError() }
                header.configureHeader(data: PromotionHeaderData.seventhSectionHeaderData())
                return header
            default:
                return UICollectionReusableView()
            }
            
        case UICollectionView.elementKindSectionFooter:
            if indexPath.section == 3 {
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: HomeSeeAllReusableView.className,
                                                                                   for: indexPath) as? HomeSeeAllReusableView else { fatalError() }
                return footer
            } else {
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
}
