//
//  NetworkResult.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/06/11.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
