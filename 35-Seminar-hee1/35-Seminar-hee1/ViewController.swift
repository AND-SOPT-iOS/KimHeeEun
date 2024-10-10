//
//  ViewController.swift
//  35-Seminar-hee1
//
//  Created by 김희은 on 10/5/24.
//

import UIKit


class ViewController: UIViewController {
    // 선언과 동시에 초기화하는 방식
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "희은의 세미나 첫 실습"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0 // 0(무한대) or 2, 3, 4, ...
        return label
    }()
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "전환 모드 선택 : 네비게이션"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0 // 0(무한대) or 2, 3, 4, ...
        return label
    }()
    
    private let feelingTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "소감을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [titleLabel, subTitleLabel, feelingTextField, nextButton, pushModeToggleButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                feelingTextField.topAnchor.constraint(
                    equalTo: subTitleLabel.bottomAnchor,
                    constant: 20
                ),
                feelingTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                feelingTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                feelingTextField.heightAnchor.constraint(equalToConstant: 40),
                
                nextButton.topAnchor.constraint(
                    equalTo: feelingTextField.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 200),
                
                pushModeToggleButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalTo: nextButton.heightAnchor),
                pushModeToggleButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor)
                
            ]
        )
    }
    //@objc = objectiveC
    private func updateUI() {
        self.subTitleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let title = feelingTextField.text else {
            return
        }
        
        nextViewController.dataBine(title: title)
        
        if pushMode {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
}

