//
//  Environment.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
} // 어디서든 만들지 않고 사용 가능. : baseURL세팅 완료.
