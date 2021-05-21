//
//  OliveHomeVC.swift
//  OliveYoung_iOS
//
//  Created by 장서현 on 2021/05/15.
//

import UIKit

class OliveHomeVC : BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //let homeViews : [BaseVC] = [RankingVC(), OtkVC(), SinsangVC(), RankingVC(), KihoickVC(), EventVC()]
    
    var homeViews  : [BaseVC] = []

    func scrollToMenuIndex(menuIdx: Int){
        let indexPath = NSIndexPath(item: menuIdx, section: 0)
        collectionView.isPagingEnabled = false;
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        collectionView.isPagingEnabled = true
        
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.OliveHomeVC = self
        return mb
    }()
    
    private func setUpMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|-82-[v0(42)]", views: menuBar)
        
    }
    
    private func setHomeViews(){
        let rankStoryboard = UIStoryboard(name: "OliveHome", bundle: nil)
        guard let rankVC = rankStoryboard.instantiateViewController(identifier: "RankingVC") as? RankingVC
        else {return}
            

        homeViews.append(contentsOf: [SinsangVC(), OtkVC(), OtkVC(),rankVC, OtkVC(), OtkVC()])
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuBar()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(DetailCollectionViewCell.nib(), forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        self.navigationController?.navigationBar.isHidden = true;
        setHomeViews()
        collectionView.reloadData()
        
        
        
    }
}

extension OliveHomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 6
    }
     
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width

        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        self.addChild(homeViews[indexPath.item])
        cell.addSubview(homeViews[indexPath.item].view)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}
