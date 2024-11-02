//
//  ViewController.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    private var userNameTextField = UITextField()
    private var signUpButton = UIButton()
    private var resultLabel = UILabel()
      
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUI()
        setStyle()
        setConstraints()
    }

    private func setUI() {
        [userNameTextField, signUpButton, resultLabel].forEach(view.addSubview)
    }
    
    private func setStyle() {
        userNameTextField.do {
            $0.textColor = .label
            $0.placeholder = "이름을 입력해주세요"
            $0.borderStyle = .roundedRect
            
        }
        signUpButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.label, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
        resultLabel.do {
            $0.textColor = .label
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20)
        }
    }
    
    private func setConstraints() {
        userNameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func signUpButtonTapped() {
      userService.register(
        username: userNameTextField.text!,
        password: "123",
        hobby: "123"
      ) { [weak self] result in
        DispatchQueue.main.async {
          guard let self = self else { return }

          var text: String
          switch result {
          case .success:
            text = "회원 등록 성공했어요." //성공했을 때
          case let .failure(error):
            text = error.errorMessage //실패했을 때 <- Network Error파일에 있음.
          }
          self.resultLabel.text = text
        }
      }
    }

}

