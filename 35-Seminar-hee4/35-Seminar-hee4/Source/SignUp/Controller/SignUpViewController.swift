//
//  ViewController.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    private var userNameLabel = UILabel()
    private var userPasswordLabel = UILabel()
    private var userHobbyLabel = UILabel()
    private var userNameTextField = UITextField()
    private var userPasswordTextField = UITextField()
    private var userHobbyTextField = UITextField()
    private var signUpButton = UIButton()
    private var resultLabel = UILabel()
    
    private var signInButton = UIButton()
    
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setConstraints()
    }
    
    private func setUI() {
        [userNameLabel, userPasswordLabel, userHobbyLabel, userNameTextField, userPasswordTextField, userHobbyTextField, signUpButton, resultLabel, signInButton].forEach(view.addSubview)
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
        userHobbyLabel.do {
            $0.text = "취미"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .label
            $0.textAlignment = .left
        }
        userHobbyTextField.do {
            $0.textColor = .label
            $0.placeholder = "취미를 입력해주세요(8자 이내)"
            $0.borderStyle = .roundedRect
        }
        signUpButton.do {
            $0.setTitle("회원 등록하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
        resultLabel.do {
            $0.textColor = .systemRed
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12)
        }
        
        signInButton.do {
            $0.setTitle("로그인 하러 가기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
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
        userHobbyLabel.snp.makeConstraints {
            $0.leading.equalTo(userNameLabel)
            $0.top.equalTo(userPasswordTextField.snp.bottom).offset(20)
        }
        userHobbyTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(userHobbyLabel.snp.bottom).offset(10)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(userHobbyTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
        }
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
        }
    }
    
    @objc func signUpButtonTapped() {
      userService.register(
        username: userNameTextField.text!, // optional처리
        password: userPasswordTextField.text!,
        hobby: userHobbyTextField.text!
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
    
    @objc func signInButtonTapped() {
        let nextVC = SignInViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

