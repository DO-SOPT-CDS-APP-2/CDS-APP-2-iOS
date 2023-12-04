//
//  SecondDetailCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

final class SecondDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private let eventImage = UIImageView()
    private let eventTitleLabel = UILabel()
    private let eventDurationLabel = UILabel()
    private let eventStackView = UIStackView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - set UI
    
    private func setUI() {
        eventTitleLabel.do {
            $0.font = .krBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
        
        eventDurationLabel.do {
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
            $0.textColor = .mediumGray
        }
        
        eventStackView.do {
            $0.axis = .vertical
            $0.spacing = 10.adjusted
        }
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        eventStackView.addArrangedSubviews(eventImage,
                                           eventTitleLabel,
                                           eventDurationLabel)
        
        contentView.addSubview(eventStackView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        eventStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(217.adjusted)
            $0.height.equalTo(250.adjusted)
        }
    }
    
    func bindData(item: EventItem) {
        eventImage.image = item.image
        eventTitleLabel.text = item.eventTitle
        eventDurationLabel.text = item.eventDuration
    }
}
