//
//  ViewController.swift
//  35-Seminar-hee1
//
//  Created by 김희은 on 10/5/24.
//

import UIKit


class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "희은의 세미나 첫 실습"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taeyomi")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "첫 세미나의 소감을 입력하시오."
        label.textColor = .darkGray
        return label
    }()
    
    private let feelingTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let pushModeLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0 // 0(무한대) or 2, 3, 4, ...
        return label
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
        [titleLabel, imageView, subTitleLabel, feelingTextView, nextButton, pushModeLabel, pushModeToggleButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 30
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                subTitleLabel.topAnchor.constraint(
                    equalTo: imageView.bottomAnchor,
                    constant: 10
                ),
                subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                feelingTextView.topAnchor.constraint(
                    equalTo: subTitleLabel.bottomAnchor,
                    constant: 10
                ),
                feelingTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                feelingTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                feelingTextView.heightAnchor.constraint(
                    equalToConstant: 200
                  ),
                
                pushModeLabel.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
                pushModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                
                nextButton.bottomAnchor.constraint(equalTo: pushModeToggleButton.topAnchor, constant: -20),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.leftAnchor.constraint(equalTo: pushModeToggleButton.leftAnchor),
                nextButton.rightAnchor.constraint(equalTo: pushModeToggleButton.rightAnchor),

                pushModeToggleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                
                pushModeToggleButton.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalTo: nextButton.heightAnchor),
                pushModeToggleButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
                pushModeToggleButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
                
            ]
        )
    }

    
    
    
    private func updateUI() {
        self.pushModeLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let title = feelingTextView.text else {
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
