//
//  ChipView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/22.
//

import UIKit

import SnapKit
import Then

final class ChipView: UIView {
    
    // MARK: - Properties
    
    private var labelWidth = Double()
    private var labelColor = UIColor()
    private var borderColor = UIColor()
    
    // MARK: - UI Components

    var tagLabel = UILabel()
    private let frontEmptyLabel = UILabel()
    private let backEmptyLabel = UILabel()
    lazy var tagStackView = UIStackView(arrangedSubviews: [frontEmptyLabel,
                                                           tagLabel,
                                                           backEmptyLabel])
    
    // MARK: - Life Cycle
    
    init(borderColor: UIColor, labelColor: UIColor, text: String) {
        super.init(frame: CGRect())
        
        self.borderColor = borderColor
        self.labelColor = labelColor
        tagLabel.text = text
        labelWidth = Double(tagLabel.intrinsicContentSize.width)
        
        style()
        hieararchy()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        self.do {
            $0.layer.borderWidth = 1.2
            $0.layer.borderColor = borderColor.cgColor
            $0.layer.cornerRadius = 15.5
        }
        tagStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        tagLabel.do {
            $0.font = .krMedium(ofSize: 12)
            $0.textColor = labelColor
            $0.textAlignment = .center
            $0.frame.size = $0.intrinsicContentSize
        }
    }
    
    private func hieararchy() {
        addSubview(tagStackView)
    }
    
    private func layout() {
        self.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        tagStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        frontEmptyLabel.snp.makeConstraints {
            $0.width.equalTo(14.5)
        }
        
        backEmptyLabel.snp.makeConstraints {
            $0.width.equalTo(14.5)
        }
    }
}

