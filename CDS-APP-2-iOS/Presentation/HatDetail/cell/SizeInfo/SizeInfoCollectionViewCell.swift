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
    
    // MARK: - set Properties
    
    private let realSizeLabel = UILabel()
    private let hatSizeImage = UIImageView()
    
    private let cmLabel = UILabel()
    private let oneLabel = UILabel()
    private let twoLabel = UILabel()
    private let threeLabel = UILabel()
    
    private let headCircumferenceLabel = UILabel()
    private let depthLabel = UILabel()
    private let brimLengthLabel = UILabel()
    
    private let headCircumferenceStackView = UIStackView()
    private let depthStackView = UIStackView()
    private let brimLengthStackView = UIStackView()
    
    private let freeLabel = UILabel()
    private let size1Label = UILabel()
    private let size2Label = UILabel()
    private let size3Label = UILabel()
    
    private let rowStackView1 = UIStackView()
    private let rowStackView2 = UIStackView()
    private let stackView = UIStackView()

    private let thickdivideView = UIView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set UI
    
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
        
        [cmLabel, freeLabel].forEach {
            $0.font = .enDisplayMedium(ofSize: 12.adjusted)
            $0.textColor = .black
            $0.backgroundColor = .background
            $0.textAlignment = .center
        }
        
        oneLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.one
        }
        
        twoLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.two
        }
        
        threeLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.three
        }
        
        [oneLabel, twoLabel, threeLabel].forEach {
            $0.textColor = .point
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
        }
        
        headCircumferenceLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.headCircumference
        }
        
        depthLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.depth
        }
        
        brimLengthLabel.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.brimLength
        }
        
        [headCircumferenceLabel, depthLabel, brimLengthLabel].forEach {
            $0.font = .krMedium(ofSize: 12.adjusted)
            $0.textColor = .black
            $0.textAlignment = .center
        }

        size1Label.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.headCircumferenceSize
        }
        
        size2Label.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.depthSize
        }
        
        size3Label.do {
            $0.text = StringLiterals.HatDetail.SizeInfo.brimLengthSize
        }
        
        [size1Label, size2Label, size3Label].forEach {
            $0.font = .enDisplayMedium(ofSize: 12.adjusted)
            $0.textColor = .darkGray
            $0.textAlignment = .center
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.border.cgColor
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
        }
        
        [rowStackView1, rowStackView2].forEach {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
            $0.alignment = .center
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.border.cgColor
        }
        
        [headCircumferenceStackView, depthStackView, brimLengthStackView].forEach {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.border.cgColor
        }
        
        thickdivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        headCircumferenceStackView.addArrangedSubviews(oneLabel,
                                                       headCircumferenceLabel)
        depthStackView.addArrangedSubviews(twoLabel,
                                           depthLabel)
        
        brimLengthStackView.addArrangedSubviews(threeLabel,
                                                brimLengthLabel)
        
        rowStackView1.addArrangedSubviews(cmLabel,
                                          headCircumferenceStackView,
                                          depthStackView,
                                          brimLengthStackView)
        
        rowStackView2.addArrangedSubviews(freeLabel,
                                          size1Label,
                                          size2Label,
                                          size3Label)
        
        stackView.addArrangedSubviews(rowStackView1,
                                      rowStackView2)
        
        contentView.addSubviews(realSizeLabel,
                                hatSizeImage,
                                stackView,
                                thickdivideView)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        realSizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }
        
        hatSizeImage.snp.makeConstraints {
            $0.top.equalTo(realSizeLabel.snp.bottom).offset(20.adjusted)
            $0.centerX.equalToSuperview()
        }

        [rowStackView1, rowStackView2].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(336.adjusted)
                $0.height.equalTo((100/2).adjusted)
            }
        }
        
        [cmLabel, headCircumferenceStackView, depthStackView, brimLengthStackView, freeLabel, size1Label, size2Label, size3Label].forEach {
            $0.snp.makeConstraints {
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
            $0.height.equalTo(8.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
    }
}
