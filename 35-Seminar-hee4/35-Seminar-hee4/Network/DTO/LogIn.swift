//
//  LogIn.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/8/24.
//

struct LogInRequest: Encodable {
  let username: String
  let password: String
}

struct LogInResponse: Codable {
    let result: Token
}

struct Token: Codable {
    let token: String
}
