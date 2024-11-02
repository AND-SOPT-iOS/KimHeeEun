//
//  TitleView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import Then
import UIKit

class TitleView: UIView {
    
    private let appIconImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_toss")
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    private let titleLabel = UILabel().then {
        $0.text = "토스"
        $0.textAlignment = .left
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 20)
    }
    private let subTitleLabel = UILabel().then {
        $0.text = "금융이 쉬워진다"
        $0.textAlignment = .left
        $0.textColor = .secondaryLabel
        $0.font = .systemFont(ofSize: 15)
    }
    public lazy var installButton = UIButton().then {
        $0.setTitle("받기", for: .normal) // bold 처리 해야함.
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    public lazy var shareButton = UIButton().then {
        $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
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
        [appIconImageView, titleLabel, subTitleLabel, installButton, shareButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        appIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(appIconImageView.snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(titleLabel)
        }
        installButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(installButton.snp.bottom)
            $0.width.height.equalTo(30)
        }
    }
    
}
