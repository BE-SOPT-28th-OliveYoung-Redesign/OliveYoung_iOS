//
//  ReviewService.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/06/11.
//

import Foundation
import Alamofire

struct ReviewService {
    static let shared = ReviewService()
    
    func getReview(completion : @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의합니다.
        
        
        let URL = "http://3.34.183.244:5000/api/list/"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            
            switch dataResponse.result {
            case .success:
                                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
          
        switch statusCode {
        
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isValidData(data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode([ReviewDataModel].self, from: data)
        else {
            return .pathErr}
        return .success(decodedData)

    }
    
}

 
