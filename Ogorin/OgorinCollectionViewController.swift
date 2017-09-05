//
//  OgorinCollectionViewController.swift
//  Ogorin
//
//  Created by Rei Yamaguchi on 2017/09/05.
//  Copyright © 2017年 Rei.inc. All rights reserved.
//

import UIKit

class OgorinCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    @IBOutlet var h1: UIImageView!
    
    @IBOutlet var h2: UIImageView!
    
    @IBOutlet var h3: UIImageView!
    
    @IBOutlet var h4: UIImageView!
    
    @IBOutlet var h5: UIImageView!
    
    @IBOutlet var h6: UIImageView!
    
    @IBOutlet var navigationBar: UINavigationBar!
    let photos = ["board1","board2","board3","board4","board5","board6"]
    var flag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        // Cell はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        
        // Tag番号を使ってLabelのインスタンス生成
        let label = testCell.contentView.viewWithTag(2) as! UILabel
        label.text = photos[(indexPath as NSIndexPath).row]
        
        
        return testCell
    }
    
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 6;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func switchOgorinShop(_ sender: Any) {
        if flag == 0 {
            h1.isHidden = true
            h2.isHidden = true
            h3.isHidden = true
            h4.isHidden = true
            h5.isHidden = true
            h6.isHidden = true
            flag = 1
        }
        h1.isHidden = false
        h2.isHidden = false
        h3.isHidden = false
        h4.isHidden = false
        h5.isHidden = false
        h6.isHidden = false
        flag = 0

    }
    
//    遷移
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {}
   
}
