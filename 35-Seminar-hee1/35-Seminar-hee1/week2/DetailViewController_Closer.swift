//
//  DetailViewController_Closer.swift
//  35-Seminar-hee1
//
//  Created by 김희은 on 10/12/24.
//

import UIKit
import SnapKit

protocol DetailDelegate: AnyObject {
    func dataBind(nickname: String) // 다음화면에서 이전화면으로 Data
}
class DetailViewController_Closer: UIViewController {
    weak var delegate: DetailDelegate?
    // delegate를 사용하지 않고 클로저를 사용.
    var completionHandler: ((String) -> ())?
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "입력하시오."
        textField.textColor = .black
        textField.backgroundColor = .white
        
        return textField
    }()
    
    private lazy var delegateButton: UIButton = {
        let button = UIButton()
        button.setTitle("데이터 전달하기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
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
        [titleLabel, nicknameTextField, delegateButton, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        // SnapKit을 통해 오토레이아웃 코드 변경하기.
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 50
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                nicknameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                nicknameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                nicknameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                
                delegateButton.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
                delegateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                delegateButton.heightAnchor.constraint(equalToConstant: 44),
                delegateButton.widthAnchor.constraint(equalToConstant: 300),
                
                
                backButton.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    @objc func backButtonTapped() {
        guard let nickname = nicknameTextField.text else { return }
        completionHandler?(nickname)
        self.navigationController?.popViewController(animated: true)
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
