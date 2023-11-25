//
//  HatCategoryLayoutFactory.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

enum HatCategoryLayoutFactory {
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, environment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            switch sectionNumber {
            case 0:
                section = createRealtimeBestSection()
            default:
                section = createRealtimeBestSection()
            }
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 7.adjusted, leading: 20.adjusted, bottom: 20.adjusted, trailing: 0)
            
            return section
        }
    }
    
    //MARK: - Section0 Layout
    
    static func createRealtimeBestSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(115), heightDimension: .estimated(157)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
