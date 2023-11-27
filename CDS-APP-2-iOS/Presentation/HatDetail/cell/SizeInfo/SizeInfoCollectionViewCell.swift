//
//  SizeInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class SizeInfoCollectionViewCell: UICollectionViewCell {
    private let realSizeLabel = UILabel()
    private let hatSizeImage = UIImageView()
    
    private let cmLabel = UILabel()
    private let oneLabel = UILabel()
    private let twoLabel = UILabel()
    private let threeLabel = UILabel()
    let numberList = ["1", "2", "3"]
    
    private let sizeName1Label = UILabel()
    private let sizeName2Label = UILabel()
    private let sizeName3Label = UILabel()
    let sizeNameList = ["머리둘레", "깊이", "챙길이"]
    
    private let freeLabel = UILabel()
    private let size1Label = UILabel()
    private let size2Label = UILabel()
    private let size3Label = UILabel()
    let sizeList = ["58", "16.5", "7.5"]
    
    private let rowStackView1 = UIStackView()
    private let rowStackView2 = UIStackView()
    private let stackView = UIStackView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        realSizeLabel.do {
            $0.text = "실측 사이즈"
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
        }
        
        hatSizeImage.do {
            $0.image = ImageLiterals.img.imgHatsize
        }
        
        cmLabel.do {
            $0.text = "CM"
            $0.font = .enDisplayMedium(ofSize: 12)
            $0.textColor = .black
        }
        
        freeLabel.do {
            $0.text = "FREE"
            $0.font = .enDisplayMedium(ofSize: 12)
            $0.textColor = .black
        }
        
        
        for i in [oneLabel, twoLabel, threeLabel] {
            var num: Int = 0
            i.text = numberList[num]
            i.font = .enDisplayMedium(ofSize: 10.adjusted)
            i.textColor = .point
            num += 1
        }
        var num: Int = 0
        for i in [sizeName1Label, sizeName2Label, sizeName3Label] {
            
            i.text = sizeNameList[num]
            i.font = .krMedium(ofSize: 12)
            i.textColor = .black
            num += 1
        }
        var num2: Int = 0
        for i in [size1Label, size2Label, size3Label] {
        
            i.text = sizeList[num2]
            i.font = .enDisplayMedium(ofSize: 12.adjusted)
            i.textColor = .darkGray
            num2 += 1
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.alignment = .center
        }
        
        rowStackView1.do {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
            $0.alignment = .center
        }
        
        rowStackView2.do {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
            $0.alignment = .center
        }
    }
    
    
    // MARK: - Set UI
    
    private func setHierachy() {
        rowStackView1.addArrangedSubviews(cmLabel, sizeName1Label, sizeName2Label, sizeName3Label)
        rowStackView2.addArrangedSubviews(freeLabel, size1Label, size2Label, size3Label)
        stackView.addArrangedSubviews(rowStackView1, rowStackView2)
        contentView.addSubviews(realSizeLabel, hatSizeImage, stackView)
    }
    
    
    // MARK: - Set UI
    
    private func setLayout() {
        realSizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        hatSizeImage.snp.makeConstraints {
            $0.top.equalTo(realSizeLabel.snp.bottom).offset(20.adjusted)
            $0.centerX.equalToSuperview()
        }
        

        rowStackView1.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(99/2)
        }
        
        rowStackView2.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(99/2)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(hatSizeImage.snp.bottom).offset(20.adjusted)
            $0.leading.equalTo(realSizeLabel.snp.leading)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(99)
            
        }
        
    }
    
}
