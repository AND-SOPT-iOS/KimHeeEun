//
//  HorizonView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

private class HorizonView: UIView {
    private let lineView = UIView().then {
        $0.backgroundColor = .secondarySystemFill
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        addSubview(lineView)
    }
    
    private func setLayout() {
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
    }
}
