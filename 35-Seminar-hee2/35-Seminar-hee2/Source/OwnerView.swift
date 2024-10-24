//
//  DeveloperView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/25/24.
//

import SnapKit
import UIKit
import Then

final class OwnerView: UIView {
    
    private let ownerNameLabel = UILabel().then {
        $0.text = "hee"
        $0.textColor = .tintColor
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private let ownerJobLabel = UILabel().then {
        $0.text = "개발자"
        $0.textColor = .secondaryLabel
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private lazy var moreInfoImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .secondaryLabel
        $0.contentMode = .scaleAspectFit
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
        [ownerNameLabel, ownerJobLabel, moreInfoImageView].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        ownerNameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        ownerJobLabel.snp.makeConstraints {
            $0.top.equalTo(ownerNameLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
        }
        moreInfoImageView.snp.makeConstraints {
            $0.top.equalTo(ownerNameLabel.snp.top)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(30)
        }
    }
}
