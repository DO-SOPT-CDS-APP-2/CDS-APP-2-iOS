//
//  CategoryViewController.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

import SnapKit
import Then

// MARK: - CategoryViewController

final class CategoryViewController: UIViewController {

    // MARK: - Properties

    private let headerView = CategoryView() // View와 ViewController를 분리
    private let headerDummy = Category.dummy()
    
    private let contentView = CategoryTableView() // View와 ViewController를 분리
    private let categoryListDummy = CategoryList.dummy()
    private let categoryDetailListDummy = CategoryDetailList.dummy()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setHierachy()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(headerView, contentView)
    }
    
    // MARK: - Set Layout

    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(154.adjusted)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.categoryTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1.adjusted)
            $0.leading.bottom.equalToSuperview()
            $0.width.equalTo(114.adjusted)
        }
        
        contentView.categoryDetailTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1.adjusted)
            $0.trailing.bottom.equalToSuperview()
            $0.width.equalTo(261.adjusted)
        }
    }
    
    // MARK: - Set Delegate

    private func setDelegate() {
        headerView.horizontalCollectionView.dataSource = self
        
        contentView.categoryTableView.delegate = self
        contentView.categoryTableView.dataSource = self
        contentView.categoryDetailTableView.delegate = self
        contentView.categoryDetailTableView.dataSource = self
    }
    
    // MARK: - Set Register
    
    private func setRegister() {
        headerView.horizontalCollectionView.register(CategoryHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: CategoryHorizontalCollectionViewCell.className)
        contentView.categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.className)
        contentView.categoryDetailTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: CategoryDetailTableViewCell.className)
        
    }
   
}

// MARK: - UICollectionViewDataSource

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryHorizontalCollectionViewCell.className, for: indexPath) as? CategoryHorizontalCollectionViewCell else { return UICollectionViewCell() }
        let category = headerDummy[indexPath.row]
        cell.configureCell(category: category)
        return cell
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource (각 TableView 마다 다르게 적용)

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == contentView.categoryTableView {
            return categoryListDummy.count
        } else {
            return categoryDetailListDummy.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == contentView.categoryTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.className, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            let categoryList = categoryListDummy[indexPath.row]
            cell.configureCell(category: categoryList, index: indexPath.row)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryDetailTableViewCell.className, for: indexPath) as? CategoryDetailTableViewCell else { return UITableViewCell() }
            let categoryDetailList = categoryDetailListDummy[indexPath.row]
            cell.configureCell(category: categoryDetailList, index: indexPath.row)
            cell.selectionStyle = .none
            cell.cellDelegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == contentView.categoryTableView {
            return 56.adjusted
        } else {
            return 46.adjusted
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == contentView.categoryTableView {
            return nil
        } else {
            let headerView = CategoryDetailTableHeaderView()
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == contentView.categoryTableView {
            return 0
        } else {
            return 178.adjusted
        }
    }
}

// MARK: - Delegate Protocol

extension CategoryViewController: HatButtonAction {
    func hatButtonClicked() {
        let viewController = HatCategoryViewController()
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}
