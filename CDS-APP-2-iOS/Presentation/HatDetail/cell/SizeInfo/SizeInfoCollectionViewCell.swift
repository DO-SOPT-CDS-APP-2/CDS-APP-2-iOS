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
    let numberList = [StringLiterals.HatDetail.SizeInfo.one, StringLiterals.HatDetail.SizeInfo.two, StringLiterals.HatDetail.SizeInfo.three]
    
    private let headCircumferenceLabel = UILabel()
    private let depthLabel = UILabel()
    private let brimLengthLabel = UILabel()
    let sizeNameList = [StringLiterals.HatDetail.SizeInfo.headCircumference, StringLiterals.HatDetail.SizeInfo.depth, StringLiterals.HatDetail.SizeInfo.brimLength]
    
    private let headCircumferenceStackView = UIStackView()
    private let depthStackView = UIStackView()
    private let brimLengthStackView = UIStackView()
    
    private let freeLabel = UILabel()
    private let size1Label = UILabel()
    private let size2Label = UILabel()
    private let size3Label = UILabel()
    let sizeList = [StringLiterals.HatDetail.SizeInfo.headCircumferenceSize, StringLiterals.HatDetail.SizeInfo.depthSize, StringLiterals.HatDetail.SizeInfo.brimLengthSize]
    
    private let rowStackView1 = UIStackView()
    private let rowStackView2 = UIStackView()
    private let stackView = UIStackView()

    private let thickdivideView = UIView()
    
    
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
        contentView.backgroundColor = .white
        
        realSizeLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.realSize
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
        }
        
        hatSizeImage.do {
            $0.image = ImageLiterals.img.imgHatsize
        }
        
        cmLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.cm
        }
        
        freeLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.free
        }
        
        for i in [cmLabel, freeLabel] {
            i.font = .enDisplayMedium(ofSize: 12.adjusted)
            i.textColor = .black
            i.backgroundColor = .background
            i.textAlignment = .center
        }
        
        var num: Int = 0
        for i in [oneLabel, twoLabel, threeLabel] {
            i.text = numberList[num]
            i.font = .enDisplayMedium(ofSize: 10.adjusted)
            i.textColor = .point
            num += 1
        }
        
        var num1: Int = 0
        for i in [headCircumferenceLabel, depthLabel, brimLengthLabel] {
            i.text = sizeNameList[num1]
            i.font = .krMedium(ofSize: 12.adjusted)
            i.textColor = .black
            i.textAlignment = .center
            num1 += 1
        }
        
        
        var num2: Int = 0
        for i in [size1Label, size2Label, size3Label] {
            i.text = sizeList[num2]
            i.font = .enDisplayMedium(ofSize: 12.adjusted)
            i.textColor = .darkGray
            i.textAlignment = .center
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.border.cgColor
            num2 += 1
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
        }
        
        for i in [rowStackView1, rowStackView2] {
            i.axis = .horizontal
            i.distribution = .equalCentering
            i.alignment = .center
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.border.cgColor
        }
        
        for i in [headCircumferenceStackView, depthStackView, brimLengthStackView] {
            i.axis = .vertical
            i.alignment = .center
            i.distribution = .fillEqually
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.border.cgColor
        }
        
        thickdivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    
    // MARK: - Set UI
    
    private func setHierachy() {
        headCircumferenceStackView.addArrangedSubviews(oneLabel, headCircumferenceLabel)
        depthStackView.addArrangedSubviews(twoLabel, depthLabel)
        brimLengthStackView.addArrangedSubviews(threeLabel, brimLengthLabel)
        
        rowStackView1.addArrangedSubviews(cmLabel, headCircumferenceStackView, depthStackView, brimLengthStackView)
        rowStackView2.addArrangedSubviews(freeLabel, size1Label, size2Label, size3Label)
        stackView.addArrangedSubviews(rowStackView1, rowStackView2)
        contentView.addSubviews(realSizeLabel, hatSizeImage, stackView, thickdivideView)
    }
    
    
    // MARK: - Set UI
    
    private func setLayout() {
        realSizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }
        
        hatSizeImage.snp.makeConstraints {
            $0.top.equalTo(realSizeLabel.snp.bottom).offset(20.adjusted)
            $0.centerX.equalToSuperview()
        }

        
        for i in [rowStackView1, rowStackView2] {
            i.snp.makeConstraints {
                $0.width.equalTo(336.adjusted)
                $0.height.equalTo((100/2).adjusted)
            }
        }
        
        for i in [cmLabel, headCircumferenceStackView, depthStackView, brimLengthStackView, freeLabel, size1Label, size2Label, size3Label] {
            i.snp.makeConstraints {
                $0.width.equalTo((336/4).adjusted)
                $0.height.equalTo((100/2).adjusted)
            }
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(hatSizeImage.snp.bottom).offset(20.adjusted)
            $0.leading.equalTo(realSizeLabel.snp.leading)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(336.adjusted)
            $0.height.equalTo(100.adjusted)
        }
        
        thickdivideView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(17.adjusted)
            $0.bottom.equalTo(stackView.snp.bottom).offset(25.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
    }
}
