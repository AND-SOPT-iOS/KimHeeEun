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
            case .success(let responseData):
                guard let data = responseData else {
                    completion(.failure(.decodingError)) // 데이터가 없으면 실패 처리
                    return
                } // JSON 형식으로 return되는 response.result?
                do { // Data를 JSON으로 변환
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let result = json["result"] as? [String: Any], // dictionary값 안전 추출 : 'result' 객체 접근
                       let token = result["token"] as? String { // dictionary 값 안전 추출 : 'token' 추출
                        TokenManager.shared.saveToken(token) // TokenManager에 토큰을 저장
                        completion(.success(true))
                    } else {
                        completion(.failure(.tokenError))
                    }
                } catch {
                    completion(.failure(.decodingError)) // JSON 파싱 오류 시
                }
            case .failure:
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
