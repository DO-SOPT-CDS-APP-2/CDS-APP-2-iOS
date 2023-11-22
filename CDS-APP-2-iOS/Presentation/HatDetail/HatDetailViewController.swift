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
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupNavigationBar()
        setupCollectionView()
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainInfoCollectionViewCell.self, forCellWithReuseIdentifier: MainInfoCollectionViewCell.identifier)
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension HatDetailViewController: UICollectionViewDelegate {}
extension HatDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainInfoCollectionViewCell.identifier, for: indexPath) as! MainInfoCollectionViewCell
        //나중에 data 추가 예정
        return cell
    }
}

extension HatDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
