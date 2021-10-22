//
//  RankingVC.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/05/18.
//


import UIKit

//let cellID = "RankingCell"

class RankingVC: BaseVC {
    let width = UIScreen.main.bounds.width
    var cellwidth: CGFloat = 0
    var cellheight: CGFloat = 0
    
    let RankingCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let CV = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        flowlayout.scrollDirection = .vertical
        return CV
    }()
        
    //var backGroundImage: UIView?
            
    var appList = [RannkingListDataModel(mainImageView: "Group 126", brandLabel: "에뛰드 |", listLabel: "픽싱틴트",      reviewLabel: "매트매트하고 누디뉴디한 찐 진저밀크티 컬러 픽싱틴트! 베이스로도 좋지만 메인컬러로 사용하기 위해 구매했고... "),
                   
                   RannkingListDataModel(mainImageView: "Group 125", brandLabel: "롬앤", listLabel: "배러댄팔레트", reviewLabel: "뉴트럴의 뜻이 뭔지 아세요? 쿨톤 웜톤 상관없이 다 쓸수 있는 아이팔레트가 무슨뜻인지 아세요? 정답은 니 톤에..."),
                   
                   RannkingListDataModel(mainImageView: "Group 127", brandLabel: "코스노리", listLabel: "롱액티브세럼", reviewLabel: "진짜 이정도면 말하기도 입아픔. 9800원까지 세일하기도하지만 가끔 8400원?8600원으로 할인하기도 한다. 그때.."),
                   
                   RannkingListDataModel(mainImageView: "Group 128", brandLabel: "페리페라", listLabel: "올테이크팔레트", reviewLabel: "안녕하세요 기존에 1호 들숨에 음영 날숨에 그윽함을 매우매우 잘쓰고 있던 사용자입니다. 사실 봄라이트로 진단받.."),
                   
                   RannkingListDataModel(mainImageView: "Group 129", brandLabel: "니들리", listLabel: "데일리토너패드", reviewLabel: "토너패드 유목민인데 무난템으로 좋은거 같아요 다른 광고에서 남은 에센스가 엄청 많이 찰랑거려서 .."),
                   
                   RannkingListDataModel(mainImageView: "2021-05-12-11-38-1", brandLabel: "에뛰드", listLabel: "픽싱틴트",      reviewLabel: "매트매트하고 누디뉴디한 찐 진저밀크티 컬러 픽싱틴트! 베이스로도 좋지만 메인컬러로 사용하기 위해 구매했고... ")
                   ]
    
//    var bottomaList = [BottomImageDataModel(bottomImage: "review-bg")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sellRankingImage : UIImageView
        sellRankingImage = UIImageView(frame:CGRect(x: 0, y: 89, width:125, height:50));
        sellRankingImage.image = UIImage(named: "top-b-unpressed-1.png")
        self.view.addSubview(sellRankingImage)
        
        var reviewBestImage : UIImageView
        reviewBestImage = UIImageView(frame: CGRect(x: 125, y: 89, width: 125, height: 50));
        reviewBestImage.image = UIImage(named: "top-b-pressed.png")
        self.view.addSubview(reviewBestImage)
        
        var nowRankingImage : UIImageView
        nowRankingImage = UIImageView(frame: CGRect(x: 250, y: 89, width: 125, height: 50));
        nowRankingImage.image = UIImage(named: "top-b-unpressed.png" )
        self.view.addSubview(nowRankingImage)
        
        var reviewtitleImage : UIImageView
        reviewtitleImage = UIImageView(frame: CGRect(x: 16, y: 157, width: 100, height: 15));
        reviewtitleImage.image = UIImage(named: "review-title.png")
        self.view.addSubview(reviewtitleImage)
        
        var infoImage : UIImageView
        infoImage = UIImageView(frame: CGRect(x: 120.2, y: 159.2, width: 12.5, height: 12.5));
        infoImage.image = UIImage(named: "icon-info.png")
        self.view.addSubview(infoImage)
        
        var menuListImage : UIImageView
        menuListImage = UIImageView(frame: CGRect(x: 16, y: 188, width: 359, height: 27));
        menuListImage.image = UIImage(named: "frame-10.png")
        self.view.addSubview(menuListImage)
        
        
        
        RankingCollectionView.dataSource = self
        RankingCollectionView.delegate = self
        
        view.addSubview(RankingCollectionView)
//        view.addSubview(backGroundImage)
//        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
//        backGroundImage.backgroundColor = .lightGray
//        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        backGroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        backGroundImage.backgroundColor = .gray
        
        RankingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        RankingCollectionView.topAnchor.constraint(equalTo: menuListImage.bottomAnchor, constant: 0).isActive = true
        RankingCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        RankingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        RankingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        RankingCollectionView.backgroundColor = .white
        
//        RankingCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
//        RankingCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        RankingCollectionView.register(RankingCell.self, forCellWithReuseIdentifier: "RankingCell")
        
//        RankingCollectionView.register(BackgroundCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BackgroundCollectionReusableView.identifier)
        RankingCollectionView.reloadData()
        
        
    }
}


extension RankingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appList.count
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indextPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BackgroundCollectionReusableView, for: indexPath) as! BackgroundCollectionReusableView
//
//        header.configure()
//
//        return header
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCell.identifier, for: indexPath) as? RankingCell else {return UICollectionViewCell()}
        
        if indexPath.row == 0 {
            cell.contentView.addSubview(UIImageView(image: UIImage(named: "review-banner-1")))
            cellwidth = width * (163 / 375)
            cellheight = cellwidth * (227 / 163)
        }
        else {
            cell.setData(imageName: appList[indexPath.row-1].mainImageView, title: appList[indexPath.row-1].brandLabel, list: appList[indexPath.row-1].listLabel, review: appList[indexPath.row-1].reviewLabel)
        }
        return cell
    }

}
extension RankingVC: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == UICollectionView.elementKindSectionFooter {
//
//            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier , for: indexPath) as! FooterCollectionReusableView
//
//            footer.configure()
//            return footer
//        }
//
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier , for: indexPath) as! HeaderCollectionReusableView
//
//        header.configure()
//        return header
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        CGSize(width : view.frame.size.width, height: 200)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        CGSize(width : view.frame.size.width, height: 200)
//    }
    
}

extension RankingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        let cellwidth = width * (163 / 375)
        let cellheight = cellwidth * (227 / 163)
        return CGSize(width: cellwidth, height: cellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 21
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 21, bottom: 8, right: 21)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, cellForItemAt indexPath: IndexPath) -> IndexPath {
//        if indexPath.row == 0 {
//
//        }
//
//
//    }
   
}
//비율로 맞춤 최대한
// 현재 스크린의 가로값 기준으로 받고 대충 기종이 나온다
// 375 이상이면 어디에 있는 오토를 수정 ...!!!!!
// 다 자기 그거에 맞게 수정 !!!!!!!!!
