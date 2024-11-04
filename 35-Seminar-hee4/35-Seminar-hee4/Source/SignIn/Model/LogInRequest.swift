//
//  LogInRequest.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import Foundation

/// 로그인 API
/// 각 프로퍼티는 8자 이하여야 함
struct LogInRequest: Codable {
  let username: String
  let password: String
}
