//
//  homeViewCollectionViewCell.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/05/17.
//

import UIKit

class homeViewCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var firstLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
           // Initialization code
        firstLabel.textColor = .black
        
       }

    override var isHighlighted: Bool{
        didSet{
            firstLabel.textColor = isHighlighted ? .systemPink : .black
            }
        }
        
        override var isSelected: Bool{
            didSet{
                firstLabel.textColor = isSelected ? .systemPink : .black
            }
        }
        
   static func nib() -> UINib{
        return UINib(nibName: "homeViewCollectionViewCell", bundle: nil)
    }

    
        

}
