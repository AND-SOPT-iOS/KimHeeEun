//
//  SubTitleView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import Then
import UIKit

final class SubTitleView: UIView {
    
    private let examView = UIView().then {
        $0.backgroundColor = .systemBackground
    }
    private let titleLabel = UILabel().then {
        $0.text = "임시"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .secondaryLabel
    }
    private let numberLabel = UILabel().then {
        $0.text = "임시"
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.textColor = .secondaryLabel
    }
    private let bottomLabel = UILabel().then {
        $0.text = "임시"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .secondaryLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubview(examView)
        [titleLabel, numberLabel, bottomLabel].forEach {
            examView.addSubview($0)
        }
    }
    
    private func setLayout() {
        examView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(numberLabel.snp.top).offset(-5)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        bottomLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(5)
        }
    }
    
}
