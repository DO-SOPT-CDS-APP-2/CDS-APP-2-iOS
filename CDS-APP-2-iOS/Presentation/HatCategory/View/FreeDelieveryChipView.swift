//
//  FreeDelieveryChipView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/29/23.
//

import UIKit

final class FreeDelieveryChipView: UIView {
    
    //MARK: - set Properties
    
    private let label = UILabel()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set UI
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .background
            $0.layer.cornerRadius = 2
        }
        
        label.do {
            $0.text = "무료배송"
            $0.font = .krRegular(ofSize: 10.adjusted)
            $0.textColor = .black
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(label)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
