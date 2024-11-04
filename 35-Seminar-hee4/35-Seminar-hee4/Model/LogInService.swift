//
//  LogInService.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/2/24.
//

import Foundation
import Alamofire

class LogInService {
    
    func logIn(
        username: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/login"
        
        let parameters = LogInRequest(
            username: username,
            password: password
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                /// 네트워크 요청이 성공적으로 진행되었을 때, escaping closure을 실행하고 bool값을 success로 넘김.
                completion(.success(true))
            case .failure:
                /// 네트워크 요청이 실패했을 때, 어떤 이유인지 파악하여 escaping closure을 실행하고 파악된 error를 넘김
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(
      _ statusCode: Int,
      data: Data
    ) -> NetworkError {
      let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) { // tuple 형태로 스위치문 진행.
        case (400, "01"):
            return .expressionError
        case (400, "02"):
            return .invalidPassword // password 규격 에러
        case (403, "01"):
            return .wrongPassword // wrongPassword
        case (404, "00"):
            return .invalidURL//.wrong path/method request
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    func decodeError(data: Data) -> String {
      guard let errorResponse = try? JSONDecoder().decode(
        ErrorResponse.self,
        from: data
      ) else { return "" }
      return errorResponse.code // 00 / 01 등의 스트링 값으로 return 하게 됨
    }
}
