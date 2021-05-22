//
//  OliveReviewVC.swift
//  OliveYoung_iOS
//
//  Created by 장서현 on 2021/05/15.
//

import UIKit

class OliveReviewVC: UIViewController, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDataSource {

    var imageArroy = [UIImage(named:"img-3"), UIImage(named:"img-4"),UIImage(named:"img-5"),UIImage(named:"img-6")]
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var deviderView: UIView!
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userLavelImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UIImageView!
    
    @IBOutlet weak var deviderThinView: UIView!
    
    @IBOutlet weak var reviewRateImageView: UIImageView!
    
    @IBOutlet weak var reviewDateLabel: UILabel!
    
    @IBOutlet weak var skinTypeImageView: UIImageView!
    @IBOutlet weak var skinGominImageView: UIImageView!
    @IBOutlet weak var skinJageukImageView: UIImageView!
    @IBOutlet weak var skinTypeLabel: UILabel!
    @IBOutlet weak var skinGominLabel: UILabel!
    @IBOutlet weak var skinJaguekLabel: UILabel!
    
    @IBOutlet weak var reviewContentsLabel: UILabel!
    
    @IBOutlet weak var helpfulLabel: UILabel!
    @IBOutlet weak var helpfulButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
        // 사용할 수 있는 Font-family 출력
       //   for family in UIFont.familyNames {

       //   print("\(family)");

       //

       //   for names in UIFont.fontNames(forFamilyName: family) {

       //   print("== \(names)");

       //   }

       //   }
        
        // label.font = UIFont(name: "ArialHebrew", size: UIFont.labelFontSize)

       
       // reviewLabel.font = UIFont(name:"Noto Sans CJK KR", size: 18)
       
        //reviewLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        reviewLabel.font = UIFont(name:"NotoSansCJKkr-Bold", size: 18)
        
        
        reviewContentsLabel.numberOfLines = 50
        reviewContentsLabel.text =
        """
        토너패드 유목민인데 무난템으로 좋은거 같아요

        다른 광고에서 남은 에센스가 엄청 많이 찰랑거려서 어?나는그정도는 아닌데 싶었는데.패드 한장딱 꺼내보니까 왜인지 알겠더라구요.
        패드가 굉장히 도톰해서 에센스를 한가득 머금고 있고 있어서 그렇더라구요, 다른 패드에비해서는 확실히 에센스가 많은건 맞는거 같아요

        그리고 패드사이즈가 왕커서 팩으로 사용하기에도 좋고 패드
        가 두꺼워서 금방 마르지 않아서 좋았어요
        닦토로 사용하기에도 순면이라 자극적이지 않구요
        아하가아니라 파하,바하가 들어있어서 순하게 모공정리와 각질정리하기에 좋습니다.
        마무리감도 끈적이지 않아서 지금부터 여름까지 쭉 사용하기 좋아요
        🌟 이건 팁인데요 두번째사진참고해주세요🌟
        패드 뚜껑돌려서 여신다음에 동그란막하나 벗기고 씰형태로
        되어있는거 다까지마시고 반만까서 딱접고 뚜껑다시 돌려서 닫으면 패드집게 보관하기 아주편리합니다
        """
        
    
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        print("뒤로 갑니당")
    }
    
    @IBAction func bagButtonClicked(_ sender: Any) {
        print("장바구니 갑니당")
    }
    
    
    @IBAction func helpfulButtonClicked(_ sender: Any) {
        let greenHelpful = UIImage(named:"ic-like-number")
        
        
        if self.helpfulButton.isSelected == false
        {
            self.helpfulButton.isSelected = true
            helpfulButton.setImage(greenHelpful, for: .normal)
        }
        
        else
        {
            self.helpfulButton.isSelected = false
            helpfulButton.setImage(UIImage(named:"ic-like-number-1"), for: .normal)
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArroy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.imgImage.image = imageArroy[indexPath.row]
        
        return cell
    }
    
    // 가로 스크롤 안되게
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > 0 {
           // scrollView.contentOffset.x = 0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
