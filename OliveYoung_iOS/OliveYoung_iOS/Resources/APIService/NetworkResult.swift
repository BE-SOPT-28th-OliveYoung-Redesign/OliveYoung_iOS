//
//  NetworkResult.swift
//  OliveYoung_iOS
//
//  Created by 장서현 on 2021/05/15.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
