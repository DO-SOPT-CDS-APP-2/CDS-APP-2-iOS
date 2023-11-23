//
//  BorderView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/23/23.
//

import UIKit

final class BorderView: UIView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        self.backgroundColor = .border
    }
 
}
