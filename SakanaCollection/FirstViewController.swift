//
//  FirstViewController.swift
//  SakanaCollection
//
//  Created by 新冨健太 on 2017/06/10.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    // サムネイル画像のタイトル
        let photos = ["akebonotyoutyouuo", "akebonotyoutyouuo2","hamakumanomi","hanabirakumanomi","hatatatehaze","hirenagasuzumedai","huuraityoutyouuo","irobudai","kumadori","misujiryuukyuusuzumedai","misujityoutyouuo","mituboshikurosuzumedai"]
    
    //画像のタイトル
        let photos2 = ["アケボノチョウチョウウオ" , "アケボノチョウチョウウオ２","ハマクマノミ" ,"ハナビラクマノミ","ハタタテハゼ" ,"ヒレナガスズメダイ","フウライチョウチョウウオ","イロブダイ","クマドリ","ミスジリュウキュウスズメダイ","ミスジチョウチョウウオ","ミツボシクロスズメダイ" ]
    //  画像のタイトルの辞書型
        let photos3 = ["akebonotyoutyouuo":"アケボノチョウチョウウオ" , "akebonotyoutyouuo2":"アケボノチョウチョウウオ２","hamakumanomi":"ハマクマノミ" ,"hanabirakumanomi":"ハナビラクマノミ","hatatatehaze":"ハタタテハゼ" ,"hirenagasuzumedai":"ヒレナガスズメダイ","huuraityoutyouuo":"フウライチョウチョウウオ","irobudai":"イロブダイ","kumadori":"クマドリ","misujiryuukyuusuzumedai":"ミスジリュウキュウスズメダイ","misujityoutyouuo":"ミスジチョウチョウウオ","mituboshikurosuzumedai":"ミツボシクロスズメダイ" ]
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        label.text = photos2[(indexPath as NSIndexPath).row]
        
        
        return testCell
    }
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toSubViewController",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
        }
    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return photos.count;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
