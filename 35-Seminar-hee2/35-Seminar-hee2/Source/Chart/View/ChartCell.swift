//
//  ChartCell.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/26/24.
//

import SnapKit
import UIKit
import Then

class ChartCell: UITableViewCell {

    private lazy var iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let categoryLabel = UILabel()
    private lazy var downloadStateButton = UIButton()
    
    static let identifier = "ChartCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
    }
    
    private func setUI() {
        [iconImageView, rankingLabel, titleLabel, subTitleLabel, categoryLabel, downloadStateButton].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(10)
            $0.width.height.equalTo(50)
        }
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(10)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(10)
            $0.top.equalTo(rankingLabel)
        }
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        categoryLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel.snp.leading)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(10)
        }
        downloadStateButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func configure(app: App) {
        titleLabel.text = app.title
        iconImageView.image = app.iconImage
        rankingLabel.text = "\(app.ranking)"
        titleLabel.text = app.title
        subTitleLabel.text = app.subtitle
        categoryLabel.text = app.category
    }
}
