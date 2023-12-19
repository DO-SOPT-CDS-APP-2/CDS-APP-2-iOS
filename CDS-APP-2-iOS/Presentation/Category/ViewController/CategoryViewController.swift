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
    
    private let viewModel: ImplementCategoryViewModel

    // MARK: - Properties

    private let headerView = CategoryView() // View와 ViewController를 분리
    private let contentView = CategoryTableView() // View와 ViewController를 분리
    
    // MARK: - Life Cycle
    
    init(viewModel: ImplementCategoryViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.tabBarController?.tabBar.isHidden = false
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
        self.headerView.horizontalCollectionView.dataSource = self
        self.contentView.categoryTableView.delegate = self
        self.contentView.categoryTableView.dataSource = self
        self.contentView.categoryDetailTableView.delegate = self
        self.contentView.categoryDetailTableView.dataSource = self
    }

    // MARK: - Set Register
    
    private func setRegister() {
        headerView.horizontalCollectionView.register(CategoryHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: CategoryHorizontalCollectionViewCell.className)
        contentView.categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.className)
        contentView.categoryDetailTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: CategoryDetailTableViewCell.className)
        
        contentView.categoryTableView.tag = 1
        contentView.categoryDetailTableView.tag = 2
    }
}


extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryModel.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryHorizontalCollectionViewCell.className, for: indexPath) as? CategoryHorizontalCollectionViewCell else { return UICollectionViewCell() }
        let category = viewModel.categoryModel.value[indexPath.row]
        cell.configureCell(category: category)
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return viewModel.categoryListModel.value.count
        } else {
            return viewModel.categoryDetailListModel.value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.className, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            let categoryList = viewModel.categoryListModel.value[indexPath.row]
            cell.configureCell(category: categoryList, index: indexPath.row)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryDetailTableViewCell.className, for: indexPath) as? CategoryDetailTableViewCell else { return UITableViewCell() }
            let categoryDetailList = viewModel.categoryDetailListModel.value[indexPath.row]
            cell.configureCell(category: categoryDetailList, index: indexPath.row)
            cell.selectionStyle = .none
            cell.cellDelegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 1 {
            return nil
        } else {
            let headerView = CategoryDetailTableHeaderView()
            return headerView
        }
    }
}

// MARK: - Delegate Protocol

extension CategoryViewController: HatButtonAction {
    func hatButtonClicked() {
        let viewController = HatCategoryViewController(networkProvider: HeartButtonService())
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
