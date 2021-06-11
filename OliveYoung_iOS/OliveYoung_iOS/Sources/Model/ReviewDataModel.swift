//
//  ReviewDataModel.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/06/11.
//

import Foundation

struct ReviewDataModel: Codable {
    let id: String
    let rank: Int
    let brandLabel, listLabel: String
    let mainImageView: String
    let reviewLabel: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case rank, brandLabel, listLabel, mainImageView, reviewLabel
    }
}
