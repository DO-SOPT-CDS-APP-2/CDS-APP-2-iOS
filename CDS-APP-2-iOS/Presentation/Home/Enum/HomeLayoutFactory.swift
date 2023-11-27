//
//  LayoutFactory.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/24.
//

import UIKit

enum HomeLayoutFactory {
    
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, environment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            switch sectionNumber {
            case 0:
                section = createCardSection()
            case 1:
                section = createRecommendSection()
            default:
                section = createCardSection()
            }
            return section
        }
    }
    
    // MARK: - Section 0 에 대한 Layout
    
    static func createCardSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 4,
                                                     trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width),
                                               heightDimension: .absolute(602.adjusted))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    // MARK: - Section 1 에 대한 Layout
    
    static func createRecommendSection() -> NSCollectionLayoutSection {
        // 왼쪽의 큰 아이템
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .absolute(314.adjusted),
                                                 heightDimension: .estimated(94.adjusted))
        let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
        bigItem.contentInsets  = NSDirectionalEdgeInsets(top: 0,
                                                         leading: 20.adjusted,
                                                         bottom: 0,
                                                         trailing: 10.adjusted)

        // 오른쪽의 작은 아이템
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                   heightDimension: .fractionalHeight(1.0))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0,
                                                          trailing: 10.adjusted)

        // 작은 아이템을 가로로 묶음
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .fractionalHeight(0.5))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize,
                                                                 repeatingSubitem: smallItem,
                                                                 count: 2)
        
        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 0,
                                                                bottom: 6.adjusted,
                                                                trailing: 0)
        
        // 작은 아이템을 세로로 묶음
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .fractionalHeight(1.0))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                             repeatingSubitem: horizontalGroup,
                                                             count: 2)

        // 큰 아이템과, 작은 아이템 그룹을 하나의 그룹으로 다시 묶음
        let totalGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(800.adjusted),
                                                    heightDimension: .absolute(100.adjusted))
        let totalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: totalGroupSize,
                                                            subitems: [bigItem, verticalGroup])
        totalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                           leading: 10.adjusted,
                                                           bottom: 0,
                                                           trailing: 0)

        // 최종 그룹을 section에 반환
        let section = NSCollectionLayoutSection(group: totalGroup)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        return section
    }
}