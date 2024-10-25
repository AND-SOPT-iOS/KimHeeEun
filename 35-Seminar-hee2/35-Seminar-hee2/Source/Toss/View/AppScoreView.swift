//
//  AppScoreView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

final class AppScoreView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "평가 및 리뷰"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .label
        $0.textAlignment = .left
    }
    private let scoreLabel = UILabel().then {
        $0.text = "4.4"
        $0.font = .systemFont(ofSize: 40, weight: .heavy)
        $0.textColor = .label
        $0.textAlignment = .center
    }
    private let baseScoreLabel = UILabel().then {
        $0.text = "5점 만점"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .secondaryLabel
        $0.textAlignment = .center
    }
    public lazy var allReviewButton = UIButton().then {
        $0.setTitle("모두 보기", for: .normal)
        $0.backgroundColor = .systemBackground
        $0.setTitleColor(.tintColor, for: .normal)
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
        [titleLabel, scoreLabel, baseScoreLabel, baseScoreLabel, allReviewButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        scoreLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(titleLabel)
        }
        baseScoreLabel.snp.makeConstraints {
            $0.top.equalTo(scoreLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(titleLabel)
        }
        allReviewButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(20)
        }
    }
    
}
