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
    
    private let recommendSmallCellData: [RecommendSmallCellData] = [RecommendSmallCellData(image: ImageLiterals.img.imgHome2,
                                                                                           text: StringLiterals.Home.secondSection.winter),
                                                                    RecommendSmallCellData(image: ImageLiterals.img.imgHome3,
                                                                                           text: StringLiterals.Home.secondSection.jewelry),
                                                                    RecommendSmallCellData(image: ImageLiterals.img.imgHome4,
                                                                                           text: StringLiterals.Home.secondSection.best),
                                                                    RecommendSmallCellData(image: ImageLiterals.img.imgHome5,
                                                                                           text: StringLiterals.Home.secondSection.present),]
    
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
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
            print(indexPath.count)
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
        }
    }
}
