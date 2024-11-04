//
//  SignInViewController.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import UIKit

class SignInViewController: UIViewController {

    private let userNameLabel = UILabel()
    private let userPasswordLabel = UILabel()
    private var userNameTextField = UITextField()
    private var userPasswordTextField = UITextField()
    private var signInButton = UIButton()
    private var resultLabel = UILabel()
    
    
    let logInService = LogInService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setConstraints()
    }
    private func setUI() {
        [userNameLabel, userPasswordLabel, userNameTextField, userPasswordTextField, signInButton, resultLabel].forEach(view.addSubview)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
        
        userNameLabel.do {
            $0.text = "이름"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .label
            $0.textAlignment = .left
        }
        userNameTextField.do {
            $0.textColor = .label
            $0.placeholder = "이름을 입력해주세요(8자 이내)"
            $0.borderStyle = .roundedRect
            
        }
        userPasswordLabel.do {
            $0.text = "비밀번호"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .label
            $0.textAlignment = .left
        }
        userPasswordTextField.do {
            $0.textColor = .label
            $0.placeholder = "비밀번호를 입력해주세요(8자 이내)"
            $0.borderStyle = .roundedRect
            
        }
        signInButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        }
        resultLabel.do {
            $0.textColor = .systemRed
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12)
        }
    }
    
    private func setConstraints() {
        userNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(200)
        }
        userNameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(10)
        }
        userPasswordLabel.snp.makeConstraints {
            $0.leading.equalTo(userNameLabel)
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
        }
        userPasswordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(userPasswordLabel.snp.bottom).offset(10)
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(userPasswordTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
        }
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func signInButtonTapped() {
        logInService.logIn(
        username: userNameTextField.text!, // optional처리
        password: userPasswordTextField.text!
        //hobby: userHobbyTextField.text!
      ) { [weak self] result in
        DispatchQueue.main.async {
          guard let self = self else { return }

          var text: String
          switch result {
          case .success:
            text = "로그인 성공했어요." //성공했을 때
          case let .failure(error):
            text = error.errorMessage //실패했을 때 <- Network Error파일에 있음.
          }
          self.resultLabel.text = text
        }
      }
    }
}
