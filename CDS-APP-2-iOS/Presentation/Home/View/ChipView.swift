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
    enum ChipStyle {
        case backgroundIsBlack
        case backgroundIsWhite
    }
    
    // MARK: - UI Components

    var tagLabel = UILabel()
    private let frontEmptyLabel = UILabel()
    private let backEmptyLabel = UILabel()
    lazy var tagStackView = UIStackView(arrangedSubviews: [frontEmptyLabel,
                                                           tagLabel,
                                                           backEmptyLabel])
    
    // MARK: - Life Cycle
    
    init(text: String, chipStyle: ChipStyle) {
        super.init(frame: CGRect())
        
        switch chipStyle {
        case .backgroundIsBlack:
            self.borderColor = .white.withAlphaComponent(0.2)
            self.labelColor = .white.withAlphaComponent(0.6)
            
        case.backgroundIsWhite:
            self.borderColor = .border
            self.labelColor = .lightGray
        }
        
        tagLabel.text = text
        labelWidth = Double(tagLabel.intrinsicContentSize.width)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
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
    
    private func setHierachy() {
        addSubview(tagStackView)
    }
    
    private func setLayout() {
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
