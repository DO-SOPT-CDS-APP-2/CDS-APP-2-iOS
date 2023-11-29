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
            case 3:
                section = createProductSection()
            case 4:
                section = createBrandIssueSection()
            case 5:
                section = createPopularSection()
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
                                                        bottom: 0,
                                                        trailing: 20.adjusted)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    static func createProductSection() -> NSCollectionLayoutSection {
        
        // 가로로 3줄, 세로로 2줄로 만들어야 함
        // 가로로 3개, 한줄을 만들어주는 작업 먼저 수행. 한 줄에 3개 있어야 하므로 .fractionalWidth(1 / 3)
        let firstItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 3),
                                                   heightDimension: .fractionalHeight(1))
        let firstItem = NSCollectionLayoutItem(layoutSize: firstItemSize)
        
        firstItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0.adjusted,
                                                          trailing: 8.adjusted)
        
        // 위에서 만들어준 아이템을 가로로 3개 묶음
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .fractionalHeight(1))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, repeatingSubitem: firstItem, count: 3)
        
        // 가로로 3개 묶은 하나의 그룹을, 다시 세로로 2줄 묶음
        // 이때, 가로 그룹과 아이템의 크기를 지정해주지 않았으므로
        // 내가 원하는 레이아웃이 나오려면 너비와 높이를 어느정도 명시적으로 지정해주어야 함
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(546.adjusted),
                                                       heightDimension: .estimated(230.adjusted))

        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, repeatingSubitem: horizontalGroup, count: 2)
        verticalGroup.contentInsets = NSDirectionalEdgeInsets(top: 4.adjusted,
                                                              leading: 0,
                                                              bottom: 20.adjusted,
                                                              trailing: 0)
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // 헤더 및 푸터 지정
        section.boundarySupplementaryItems = [
            self.createSupplementaryHeaderItem(forSection: 3),
            self.createSupplementaryFooterItem()
        ]
        
        // leading, trailing은 헤더 푸터에게 둘 다 적용되는 듯 하나
        // top과 bottom은 그룹과 헤더/푸터 간의 간격을 조정하는데 쓰이는 듯 함
        section.contentInsets = NSDirectionalEdgeInsets(top: 11.adjusted,
                                                        leading: 21.adjusted,
                                                        bottom: 5.adjusted,
                                                        trailing: 21.adjusted)
        
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    static func createBrandIssueSection() -> NSCollectionLayoutSection {
        // 상단의 큰 아이템
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                 heightDimension: .estimated(324.adjusted))
        let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
        
        // 상단의 큰 아이템을 가로로 묶음
        let bigHorizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1))

        let bigHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bigHorizontalGroupSize,
                                                                 repeatingSubitem: bigItem,
                                                                 count: 2)
        bigHorizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 0,
                                                                   bottom: 11.adjusted,
                                                                   trailing: 10.adjusted)
        
        
        // 아래의 작은 아이템
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 4),
                                                   heightDimension: .estimated(173.adjusted))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)

        // 작은 아이템을 가로로 묶음
        let smallHorizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .fractionalHeight(1))
        let smallHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallHorizontalGroupSize,
                                                                 repeatingSubitem: smallItem,
                                                                 count: 4)
        
        smallHorizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0,
                                                          trailing: 8.adjusted)
        
        // 크고, 작은 아이템들을 세로로 묶음
        let totalGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(560.adjusted),
                                                    heightDimension: .estimated(324.adjusted))
        let totalGroup = NSCollectionLayoutGroup.vertical(layoutSize: totalGroupSize,
                                                          subitems: [bigHorizontalGroup, smallHorizontalGroup])

        // 최종 그룹을 section에 반환
        let section = NSCollectionLayoutSection(group: totalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15.adjusted,
                                                        leading: 20.adjusted,
                                                        bottom: 0,
                                                        trailing: 10.adjusted)
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem(forSection: 4)]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    static func createPopularSection() -> NSCollectionLayoutSection {

        let firstItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 6),
                                                   heightDimension: .fractionalHeight(1))
        let firstItem = NSCollectionLayoutItem(layoutSize: firstItemSize)
        
        firstItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0.adjusted,
                                                          trailing: 8.adjusted)
        
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .fractionalHeight(1))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, repeatingSubitem: firstItem, count: 6)
        
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(780.adjusted),
                                                       heightDimension: .estimated(154.adjusted))

        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, repeatingSubitem: horizontalGroup, count: 2)
        verticalGroup.contentInsets = NSDirectionalEdgeInsets(top: 10.adjusted,
                                                              leading: 0,
                                                              bottom: 0,
                                                              trailing: 0)
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // 헤더 및 푸터 지정
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem(forSection: 5)]
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20.adjusted,
                                                        leading: 20.adjusted,
                                                        bottom: 5.adjusted,
                                                        trailing: 12.adjusted)
        
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    static func createSupplementaryHeaderItem(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerElement: NSCollectionLayoutBoundarySupplementaryItem
        
        switch section {
        case 2:
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .estimated(423.adjusted)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        case 3, 4:
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .estimated(112.adjusted)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        case 5:
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .estimated(65.adjusted)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
            
        default:
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(0),
                                                                                          heightDimension: .estimated(0)),
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        }
        return headerElement
    }
    
    static func createSupplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .estimated(40.adjusted)),
                                                                        elementKind: UICollectionView.elementKindSectionFooter,
                                                                        alignment: .bottom)
        return footerElement
    }
}
