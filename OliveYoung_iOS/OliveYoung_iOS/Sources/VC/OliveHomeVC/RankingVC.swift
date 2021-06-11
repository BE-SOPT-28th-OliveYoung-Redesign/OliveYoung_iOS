//
//  RankingVC.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/05/18.
//
import UIKit

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
    var arr : [ReviewDataModel] = []
    var appList = [RannkingListDataModel(mainImageView: "Group 126", brandLabel: "에뛰드 |", listLabel: "픽싱틴트",      reviewLabel: "매트매트하고 누디뉴디한 찐 진저밀크티 컬러 픽싱틴트! 베이스로도 좋지만 메인컬러로 사용하기 위해 구매했고... "),
                   
                   RannkingListDataModel(mainImageView: "Group 125", brandLabel: "롬앤", listLabel: "배러댄팔레트", reviewLabel: "뉴트럴의 뜻이 뭔지 아세요? 쿨톤 웜톤 상관없이 다 쓸수 있는 아이팔레트가 무슨뜻인지 아세요? 정답은 니 톤에..."),
                   
                   RannkingListDataModel(mainImageView: "Group 127", brandLabel: "코스노리", listLabel: "롱액티브세럼", reviewLabel: "진짜 이정도면 말하기도 입아픔. 9800원까지 세일하기도하지만 가끔 8400원?8600원으로 할인하기도 한다. 그때.."),
                   
                   RannkingListDataModel(mainImageView: "Group 128", brandLabel: "페리페라", listLabel: "올테이크팔레트", reviewLabel: "안녕하세요 기존에 1호 들숨에 음영 날숨에 그윽함을 매우매우 잘쓰고 있던 사용자입니다. 사실 봄라이트로 진단받.."),
                   
                   RannkingListDataModel(mainImageView: "Group 129", brandLabel: "니들리", listLabel: "데일리토너패드", reviewLabel: "토너패드 유목민인데 무난템으로 좋은거 같아요 다른 광고에서 남은 에센스가 엄청 많이 찰랑거려서 .."),
                   
                   RannkingListDataModel(mainImageView: "2021-05-12-11-38-1", brandLabel: "에뛰드", listLabel: "픽싱틴트",      reviewLabel: "매트매트하고 누디뉴디한 찐 진저밀크티 컬러 픽싱틴트! 베이스로도 좋지만 메인컬러로 사용하기 위해 구매했고... ")
                   ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setReviewData()
        print("뷰디드로드", arr.count)
        
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
        RankingCollectionView.register(RankingCell.self, forCellWithReuseIdentifier: "RankingCell")

        view.addSubview(RankingCollectionView)
        RankingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        RankingCollectionView.topAnchor.constraint(equalTo: menuListImage.bottomAnchor, constant: 0).isActive = true
        RankingCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        RankingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        RankingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        RankingCollectionView.backgroundColor = .white
        RankingCollectionView.reloadData()
    }
    
    // parentVC
    func getParentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func setReviewData() {
        ReviewService.shared.getReview { (response) in
            switch(response)
            {
            case .success(let ReviewDataModel):
                if let data = ReviewDataModel as? [ReviewDataModel] {
                    for i in 0...data.count-1 {
                        self.arr.append(data[i])
                    }
                    for i in 0...self.arr.count-1 {
                        print(self.arr[i])
                    }
                    self.RankingCollectionView.reloadData()
                }
            case .requestErr(let message) :
                print("requestERR",message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    mㅐ
}
extension RankingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCell.identifier, for: indexPath) as? RankingCell else {return UICollectionViewCell()}
            
            cell.contentView.addSubview(UIImageView(image: UIImage(named: "review-banner-1")))
            cellwidth = width * (163 / 375)
            cellheight = cellwidth * (227 / 163)
//            print("1")
            return cell
        }
        
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCell.identifier, for: indexPath) as? RankingCell else {return UICollectionViewCell()}
//            print("collectionView")
//            print(self.arr.count)
            if self.arr.count > 0
            {
            cell.setData(imageName: arr[indexPath.row-1].mainImageView, title: arr[indexPath.row-1].brandLabel, list: arr[indexPath.row-1].listLabel, review: arr[indexPath.row-1].reviewLabel)
//                print("2")
                return cell
            }
            else
            {
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let parentVC = self.getParentViewController()
        let storyBoard: UIStoryboard = UIStoryboard(name: "OliveReview", bundle: nil)
        guard let nextVC = storyBoard.instantiateViewController(identifier: "OliveReviewVC") as? OliveReviewVC else {return}
        
        parentVC?.navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension RankingVC: UICollectionViewDelegate {
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

}
