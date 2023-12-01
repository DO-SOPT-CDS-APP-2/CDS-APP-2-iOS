//
//  HatCategoryViewController.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class HatCategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private let headerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    private let hatCategoryMainView = HatCategoryMainView()
    
    private let headerDummy = HeaderCategory.headerDummy()
    private let realtimeBestDummy = RealtimeBestItem.realtimeBestDummy()
    private let filterDummy = FilterCategory.filterCategoryDummy()
    private var detailProductData : [HatCategoryDTO]?
    private let heartAndStarDummy = DetailProductHeartandStar.heartAndStarDummy()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setNavigationBar()
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
        
        self.setHeaderCollectionViewLayout()
        self.setRegister()
        self.setDelegate()
        
        self.getDetailProductWithAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: ImageLiterals.icon.icBack.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(popTapped))
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - set UI
    
    private func setUI() {
        headerCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        
        divisionLine.do {
            $0.layer.addBorder([.bottom], color: .border, width: 1)
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(headerCollectionView,
                              divisionLine,
                              hatCategoryMainView)
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        headerCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88.adjusted)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43.adjusted)
        }
        
        divisionLine.snp.makeConstraints {
            $0.top.equalTo(headerCollectionView.snp.bottom).offset(1.adjusted)
            $0.height.equalTo(1.adjusted)
            $0.leading.trailing.equalToSuperview()
        }
        
        hatCategoryMainView.snp.makeConstraints {
            $0.top.equalTo(divisionLine.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    //MARK: - set Register
    
    private func setRegister() {
        self.headerCollectionView.register(HeaderCollectionViewCell.self,
                                           forCellWithReuseIdentifier: HeaderCollectionViewCell.className)
        hatCategoryMainView.realtimeBestCollectionView.register(RealTimeBestCollectionViewCell.self, forCellWithReuseIdentifier: RealTimeBestCollectionViewCell.className)
        hatCategoryMainView.productFilterCollectionView.register(FilterCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FilterCategoryCollectionViewCell.className)
        hatCategoryMainView.detailProductCollectionView.register(DetailProductCollectionViewCell.self, forCellWithReuseIdentifier: DetailProductCollectionViewCell.className)
    }
    
    //MARK: - set Delegate
    
    private func setDelegate() {
        self.headerCollectionView.delegate = self
        self.headerCollectionView.dataSource = self
        
        hatCategoryMainView.realtimeBestCollectionView.delegate = self
        hatCategoryMainView.realtimeBestCollectionView.dataSource = self
        
        hatCategoryMainView.productFilterCollectionView.delegate = self
        hatCategoryMainView.productFilterCollectionView.dataSource = self
        
        hatCategoryMainView.detailProductCollectionView.delegate = self
        hatCategoryMainView.detailProductCollectionView.dataSource = self
    }
    
    // MARK: - Methods
    
    private func getDetailProductWithAPI() {
        Task {
            do {
                let status = try await HatCategoryService.shared.getHatCategoryData(categoryId: 1)
                detailProductData = status?.data
                hatCategoryMainView.detailProductCollectionView.reloadData()
            }
        }
    }
    
    private func setNavigationBar() {
        self.navigationController?.setBackgroundColor()
        self.navigationController?.setButtonItem()
        self.navigationController?.setCenterItem()
    }
    
    private func setHeaderCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 9
        self.headerCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    @objc
    func popTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension

extension HatCategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.headerCollectionView {
            return headerDummy.count
        }
        else if collectionView == hatCategoryMainView.realtimeBestCollectionView {
            return realtimeBestDummy.count
        }
        else if collectionView == hatCategoryMainView.productFilterCollectionView {
            return filterDummy.count
        }
        else {
            return detailProductData?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1. 고정영역의 수평 컬렉션뷰
        if collectionView == self.headerCollectionView {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.className, for: indexPath) as? HeaderCollectionViewCell else { return UICollectionViewCell()}
            
            item.bindData(category: headerDummy[indexPath.row].label)
            return item
        }
        // 2. 실시간 베스트 수평 컬렉션뷰
        else if collectionView == hatCategoryMainView.realtimeBestCollectionView {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimeBestCollectionViewCell.className, for: indexPath) as? RealTimeBestCollectionViewCell else { return UICollectionViewCell() }
            
            item.bindData(item: realtimeBestDummy[indexPath.row])
            return item
        }
        // 3. 필터링 카테고리 수평 컬렉션뷰
        else if collectionView == hatCategoryMainView.productFilterCollectionView {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCategoryCollectionViewCell.className, for: indexPath) as? FilterCategoryCollectionViewCell else { return UICollectionViewCell() }
            
            item.bindData(filterCategory: filterDummy[indexPath.row].label)
            return item
        }
        // 4. 상세 상품 수직 컬렉션뷰
        else {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailProductCollectionViewCell.className, for: indexPath) as? DetailProductCollectionViewCell else { return UICollectionViewCell() }
            

            // 좋아요 클릭 토글
            item.handler = { [weak self] in
                guard let self else { return }
                self.putHeartButtonTappedWithAPI(index: indexPath.row)
                item.isTapped.toggle()
            }
            item.bindData(data: detailProductData?[indexPath.item] ?? HatCategoryDTO(productId: Int(),
                                                                                     imageUrl: String(),
                                                                                     brand: String(),
                                                                                     name: String(),
                                                                                     discount: Int(),
                                                                                     price: Int()))
            item.bindHeartandStarNumber(data: heartAndStarDummy[indexPath.row])
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productId = detailProductData?[indexPath.item].productId
        
        if productId == 3 {
            let hatDetailViewController = HatDetailViewController(forProductId: productId ?? 0)
            self.navigationController?.pushViewController(hatDetailViewController, animated: true)
        }
    }
}

extension HatCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 고정영역의 컬렉션뷰 아이템의 동적 width 적용을 위한 익스텐션 추가
        if collectionView == self.headerCollectionView {
            let text = headerDummy[indexPath.item].label
            let font = UIFont.krMedium(ofSize: 14.adjusted)
            let textWidth = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: font]).width
            
            let cellWidth = textWidth + 18
            return CGSize(width: cellWidth, height: 43.adjusted)
        }
        else if collectionView == hatCategoryMainView.realtimeBestCollectionView {
            return CGSize(width: 115.adjusted, height: 157.adjusted)
        }
        // 스크롤영역의 컬렉션뷰 아이템의 동적 width 적용을 위한 익스텐션 추가
        else if collectionView == hatCategoryMainView.productFilterCollectionView {
            let text = filterDummy[indexPath.item].label
            let font = UIFont.krSemiBold(ofSize: 12.adjusted)
            let image = ImageLiterals.icon.icDetailDownGraySmall
            let textWidth = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: font]).width
            let imageWidth = image.size.width
            
            let cellWidth = textWidth + imageWidth + 31
            return CGSize(width: cellWidth, height: 31.adjusted)
        }
        else {
            return CGSize(width: 187.adjusted, height: 314.adjusted)
        }
    }
}

// 고정영역의 컬렉션뷰 첫번째 아이템의 볼드체 처리를 위한 익스텐션 추가
extension HatCategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let headerCell = cell as? HeaderCollectionViewCell else {
            return
        }
        
        // 첫 번째 셀 속성 처리
        if indexPath.item == 0 {
            headerCell.categoryLabel.textColor = UIColor.black
            headerCell.categoryLabel.font = UIFont.krBold(ofSize: 14.adjusted)
        }
    }
}

// MARK: - Network

extension HatCategoryViewController {
    private func putHeartButtonTappedWithAPI(index: Int) {
        Task {
            do {
                let memberId = 1
                if let result = try await HeartButtonService.shared.putDataTransferObject(memberId: memberId, productId: index + 1) {
                    print(result.data.isMade)
                }
            } catch {
                print(error)
            }
        }
    }
}
