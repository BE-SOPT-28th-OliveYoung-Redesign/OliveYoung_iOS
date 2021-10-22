//
//  DetailCollectionViewCell.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/05/17.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib{
        return UINib(nibName: "DetailCollectionViewCell", bundle: nil)
    }
}
