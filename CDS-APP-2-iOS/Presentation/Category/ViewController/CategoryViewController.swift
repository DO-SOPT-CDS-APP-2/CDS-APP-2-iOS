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
    
    private let viewModel: CategoryViewModel?

    // MARK: - Properties

    private let headerView = CategoryView() // View와 ViewController를 분리
    private let contentView = CategoryTableView() // View와 ViewController를 분리
    
    // MARK: - Life Cycle
    
    init(viewModel: CategoryViewModel){
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
        bindViewModel()
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func bindViewModel() {
        self.headerView.horizontalCollectionView.dataSource = viewModel
        self.contentView.categoryTableView.delegate = viewModel
        self.contentView.categoryTableView.dataSource = viewModel
        self.contentView.categoryDetailTableView.delegate = viewModel
        self.contentView.categoryDetailTableView.dataSource = viewModel
        
        self.viewModel?.pushViewController.bind { [weak self] _ in
            guard let self else { return }
            if self.viewModel?.pushViewController.value == true {
                let viewController = HatCategoryViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
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

    // MARK: - Set Register
    
    private func setRegister() {
        headerView.horizontalCollectionView.register(CategoryHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: CategoryHorizontalCollectionViewCell.className)
        contentView.categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.className)
        contentView.categoryDetailTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: CategoryDetailTableViewCell.className)
        
        contentView.categoryTableView.tag = 1
        contentView.categoryDetailTableView.tag = 2
    }
}
