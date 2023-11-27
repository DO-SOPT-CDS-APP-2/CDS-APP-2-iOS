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
            case 2:
                section = createPromotionSection()
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
    
    static func createPromotionSection() -> NSCollectionLayoutSection {
        
        //세로로 아이템 두개를 두기 위해 fractionalHeight를 0.5로 지정
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // cell 간의 간격 지정 leading, trailing은 section에서 지정할 것이므로 0으로 지정
        item.contentInsets = NSDirectionalEdgeInsets(top: 10.adjusted,
                                                     leading: 0,
                                                     bottom: 0,
                                                     trailing: 0)
        
        // group height에는 header가 포함되지 않음. 따라서 cell의 height영역만 상수로 지정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(154.adjusted))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // top은 header와의 간격을 위해 지정. section에는 header도 포함.
        // cell과 header 한번에 좌우 간격 잡기 위해서 section에서 inset 지정
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem(forSection: 2)]
        section.contentInsets = NSDirectionalEdgeInsets(top: 18.adjusted,
                                                        leading: 20.adjusted,
                                                        bottom: 90.adjusted,
                                                        trailing: 20.adjusted)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    static func createSupplementaryHeaderItem(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerElement: NSCollectionLayoutBoundarySupplementaryItem
        
        if section == 2 {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .estimated(423.adjusted)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        } else {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(0),
                                                                                          heightDimension: .estimated(0)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        }
        return headerElement
    }
}
