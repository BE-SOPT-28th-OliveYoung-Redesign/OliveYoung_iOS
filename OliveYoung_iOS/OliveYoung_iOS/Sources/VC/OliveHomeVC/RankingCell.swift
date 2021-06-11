//
//  RankingCell.swift
//  OliveYoung_iOS
//  Created by 김승찬 on 2021/05/19.
//

import UIKit

class RankingCell: UICollectionViewCell {
    
    static let identifier = "RankingCell"
    
    var mainImageView = UIImageView()
//    var sectionImageView = UIImageView()
    
    var brandLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = UIColor.mainBlack2
        return label
    }()
    
    var listLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    var reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 7, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.reviewLabel.numberOfLines = 2
        addSubview(mainImageView)
//        addSubview(sectionImageView)
        addSubview(brandLabel)
        addSubview(listLabel)
        addSubview(reviewLabel)
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
//        sectionImageView.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//      mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -39).isActive = true
        
//        sectionImageView.topAnchor.constraint(equalTo: )
        brandLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 4).isActive = true
        brandLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 7).isActive = true
//      brandLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
        
        listLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 4).isActive = true
        listLabel.leftAnchor.constraint(equalTo: brandLabel.rightAnchor, constant: 3).isActive = true
//      listLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
        
        reviewLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 5).isActive = true
        reviewLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 7).isActive = true
        reviewLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 7).isActive = true
        self.reviewLabel.numberOfLines = 2  
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(imageName: String,title: String, list: String, review: String) {
//        if let image = UIImage(named: imageName) {
//            mainImageView.image = image
//        }
        
//        if let image2 = UIImage(named: imageSection) {
//            sectionImageView.image = image2
//        }
        
        // 이미지 url 처리
        let url = URL(string: imageName)
        print(url)
        let data = try? Data(contentsOf: url!)
        mainImageView.image = UIImage(data: data!)
        
        brandLabel.text = title
        listLabel.text = list
        reviewLabel.text = review
    }
}


