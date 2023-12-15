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
    
    private var homeViewModel = HomeViewModel()
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFunctions()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerCell()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    
    private func addFunctions() {
        setUI()
        setHierachy()
        setLayout()
        setRegister()
        setDelegate()
        setNavigation()
    }
    
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
        homeView.homeCollectionView.delegate = homeViewModel
        homeView.homeCollectionView.dataSource = homeViewModel
    }
    
    private func setNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func registerCell() {
        homeViewModel.registerCell()
        homeView.homeCollectionView.reloadData()
    }
}
