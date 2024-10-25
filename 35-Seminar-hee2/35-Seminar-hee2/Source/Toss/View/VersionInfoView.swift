//
//  VersionInfoView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

final class VersionInfoView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "새로운 소식"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .label
        $0.textAlignment = .left
    }
    private let versionLabel = UILabel().then {
        $0.text = "버전 5.183.0"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .secondaryLabel
        $0.textAlignment = .left
    }
    public lazy var updateRecordButton = UIButton().then {
        $0.setTitle("버전 기록", for: .normal)
        $0.backgroundColor = .systemBackground
        $0.setTitleColor(.tintColor, for: .normal)
    }
    private let updateDateLabel = UILabel().then {
        $0.text = "2024.10.25"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .secondaryLabel
        $0.textAlignment = .left
    }
    private let contextLabel = UILabel().then {
        $0.text = "- 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열여있답니다. 365일 24시간 언제든지요."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .label
        $0.textAlignment = .left
        $0.numberOfLines = 0
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
        [titleLabel, versionLabel, updateRecordButton, updateDateLabel, contextLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }
        contextLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        updateRecordButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(5)
            $0.height.equalTo(titleLabel.snp.height)
        }
        updateDateLabel.snp.makeConstraints {
            $0.top.equalTo(updateRecordButton.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
}
