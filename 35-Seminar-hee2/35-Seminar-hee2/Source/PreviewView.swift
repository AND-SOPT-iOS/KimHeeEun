//
//  PreviewView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

final class PreviewView: UIView {
    private let titleLabel = UILabel().then {
        $0.text = "미리보기"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .label
        $0.textAlignment = .left
    }
    private lazy var preViewImageView = UIImageView().then {
        $0.image = UIImage(named: "preview")
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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
        addSubview(titleLabel)
        addSubview(preViewImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        preViewImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(400)
        }
    }
}
