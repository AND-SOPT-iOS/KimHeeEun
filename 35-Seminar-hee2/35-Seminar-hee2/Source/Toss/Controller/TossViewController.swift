//
//  ViewController.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/12/24.
//

import UIKit
import SnapKit

class TossViewController: UIViewController {

    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = true
    }
    
    private var contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .secondarySystemFill
    }
    
    private let titleView = TitleView()
    private let subTitleView = SubTitleView()
    private let versionInfoView = VersionInfoView()
    private let previewView = PreviewView()
    private let ownerView = OwnerView()
    private let appScoreView = AppScoreView()
    private let reviewView = ReviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setUpButton()
    }

    private func setStyle() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [titleView, subTitleView, versionInfoView, previewView, ownerView, appScoreView, reviewView].forEach { contentView.addSubview($0) }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1550)
        }
        titleView.snp.makeConstraints {
            $0.height.equalTo(150)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        subTitleView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleView.snp.bottom)
        }
        versionInfoView.snp.makeConstraints {
            $0.height.equalTo(150)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(subTitleView.snp.bottom)
        }
        previewView.snp.makeConstraints {
            $0.height.equalTo(500)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(versionInfoView.snp.bottom)
        }
        ownerView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(previewView
                .snp.bottom)
        }
        appScoreView.snp.makeConstraints {
            $0.height.equalTo(150)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(ownerView.snp.bottom)
        }
        reviewView.snp.makeConstraints {
            $0.height.equalTo(500)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(appScoreView.snp.bottom)
        }

    }
    
    private func setUpButton() {
        versionInfoView.updateRecordButton.addTarget(self, action: #selector(updateRecordButtonTapped), for: .touchUpInside)
        
        appScoreView.allReviewButton.addTarget(self, action: #selector(allReviewButtonTapped), for: .touchUpInside)
    }
}

extension TossViewController {
    @objc private func updateRecordButtonTapped() {
        print("updateRecordButtonTapped")
        let nextVC = UpdateRecordViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func allReviewButtonTapped() {
        print("allReviewButtonTapped")
        let nextVC = AllReviewViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
