//
//  ReviewView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

final class ReviewView: UIView {
    private let gettingReviewLabel = UILabel().then {
        $0.text = "탭하여 평가하기:"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .secondaryLabel
        $0.textAlignment = .left
    }
    private let reviewView = UIView().then {
        $0.backgroundColor = .tertiarySystemFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private let reviewTitleLabel = UILabel().then {
        $0.text = "토스 UX 전 버전"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let reviewDateLabel = UILabel().then {
        $0.text = "9월 27일"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .secondaryLabel
    }
    
    private let reviewUserLabel = UILabel().then {
        $0.text = "개발자 아님ㅠㅠ"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .secondaryLabel
    }
    
    private let reviewContextLabel = UILabel().then {
        $0.text = "최근 업데이트가 토스만의 UX색깔 개성 자체를 잃어버린 것 같습니다. 메인 화면 뜰 때마다 되게 부드럽고 한 눈에 보기 편했는데, 이번 업데이트로 인해 토스만의"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.numberOfLines = 0
        $0.textColor = .label
    }
    
    private let answerTitleLabel = UILabel().then {
        $0.text = "개발자 답변"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let answerDateLabel = UILabel().then {
        $0.text = "9월 29일"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .secondaryLabel
    }
    
    private let answerContextLabel = UILabel().then {
        $0.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스화면 UI를 사용자의 사용에"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.numberOfLines = 0
        $0.textColor = .label
    }
    
    private lazy var makeReviewButton = UIButton().then {
        $0.setTitle("리뷰 작성", for: .normal)
        $0.backgroundColor = .systemBackground
        $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        $0.tintColor = .systemBlue
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
        [gettingReviewLabel, reviewView, makeReviewButton].forEach {
            self.addSubview($0)
        }
        [reviewTitleLabel, reviewDateLabel, reviewUserLabel, reviewContextLabel, answerTitleLabel, answerDateLabel, answerContextLabel].forEach {
            reviewView.addSubview($0)
        }
    }
    
    private func setLayout() {
        gettingReviewLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        reviewView.snp.makeConstraints {
            $0.top.equalTo(gettingReviewLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(280)
        }
        makeReviewButton.snp.makeConstraints {
            $0.top.equalTo(reviewView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        reviewDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        reviewUserLabel.snp.makeConstraints {
            $0.top.equalTo(reviewDateLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
        reviewContextLabel.snp.makeConstraints {
            $0.top.equalTo(reviewUserLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        answerTitleLabel.snp.makeConstraints {
            $0.top.equalTo(reviewContextLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        answerDateLabel.snp.makeConstraints {
            $0.top.equalTo(answerTitleLabel.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
        answerContextLabel.snp.makeConstraints {
            $0.top.equalTo(answerDateLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
