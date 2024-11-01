//
//  HeaderView.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 11/1/24.
//

import SnapKit
import UIKit
import Then

public class HeaderView: UITableViewHeaderFooterView {
    let view = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let showAllButton = UIButton()
    
    static let identifier = "FinanceChartHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUp()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        addSubview(view)
        [titleLabel, subtitleLabel, showAllButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .label
        }
        subtitleLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .secondaryLabel
        }
        showAllButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            $0.setTitleColor(tintColor, for: .normal)
        }
    }
    
    private func setLayout() {
        view.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        showAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
    }
    
    func configure(section: FinanceSection) {
        titleLabel.text = section.title
        subtitleLabel.text = section.subtitle
        showAllButton.isHidden = !section.showAllButton
    }
    
}
