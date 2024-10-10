//
//  DetailViewController.swift
//  35-Seminar-hee1
//
//  Created by 김희은 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private var receivedTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    
    private func setStyle() {
        self.view.backgroundColor = .red
    }
    
    private func setUI() {
        [titleLabel, backButton].forEach {
          $0.translatesAutoresizingMaskIntoConstraints = false
          self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        
        NSLayoutConstraint.activate(
          [
            titleLabel.topAnchor.constraint(
              equalTo: view.safeAreaLayoutGuide.topAnchor,
              constant: 50
            ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(
              equalTo: titleLabel.bottomAnchor,
              constant: 20
            ),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 300),
          ]
        )
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
          self.dismiss(animated: true)
        } else {
          self.navigationController?.popViewController(animated: true)
        }
    }
    
    func updateUI() {
        self.titleLabel.text = receivedTitle
    }
    
    func dataBine(
        title: String
    ) {
        self.receivedTitle = title
        updateUI()
    }
    
}
