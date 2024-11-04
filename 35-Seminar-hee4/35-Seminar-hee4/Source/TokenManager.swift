//
//  TokenManager.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/5/24.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    
    private var token: String?
    
    private init() {}
    
    func saveToken(_ token: String) {
        self.token = token
    }
    func getToken() -> String? {
        return token
    }
    func clearToken() { //log-out
        self.token = nil
    }
}
