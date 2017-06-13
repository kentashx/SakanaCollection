//
//  SubViewController.swift
//  SakanaCollection
//
//  Created by 新冨健太 on 2017/06/10.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SubViewController: UIViewController{
    
    let photosSub = ["akebonotyoutyouuo", "akebonotyoutyouuo2","hamakumanomi","hanabirakumanomi","hatatatehaze","hirenagasuzumedai","huuraityoutyouuo","irobudai","kumadori","misujiryuukyuusuzumedai","misujityoutyouuo","mituboshikurosuzumedai"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImg: UIImage!
    var preSelectedNumber : NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    //画像の表示
        imageView.image = UIImage(named:photosSub[preSelectedNumber])
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
    //スワイプの認識
        // 右方向のスワイプを指定
        let rightSwipeGesture : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:Selector(("swipeGestureHandler:")))
         rightSwipeGesture.direction = UISwipeGestureRecognizerDirection.right
        // ジェスチャーを登録
        imageView.addGestureRecognizer(rightSwipeGesture)
        
        // 左方向のスワイプを指定
        let leftSwipeGesture : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:Selector(("swipeGestureHandler:")))
        leftSwipeGesture.direction = UISwipeGestureRecognizerDirection.left
        // ジェスチャーを登録
        imageView.addGestureRecognizer(leftSwipeGesture)
        
        // 上方向のスワイプを指定
        let upSwipeGesture : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:Selector(("swipeGestureHandler:")))
        upSwipeGesture.direction = UISwipeGestureRecognizerDirection.up
        // ジェスチャーを登録
        imageView.addGestureRecognizer(leftSwipeGesture)
        
        // 下方向のスワイプを指定
        let downSwipeGesture : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:Selector(("swipeGestureHandler:")))
        downSwipeGesture.direction = UISwipeGestureRecognizerDirection.down
        // ジェスチャーを登録
        imageView.addGestureRecognizer(leftSwipeGesture)
    }
    
    func swipeGestureHandler(sender:UIGestureRecognizer){
        let gesture : UISwipeGestureRecognizer = sender as! UISwipeGestureRecognizer
        // スワイプの方向を取得
        let direction : UISwipeGestureRecognizerDirection = gesture.direction
        
        switch (direction) {
        case UISwipeGestureRecognizerDirection.right:
            preSelectedNumber += 1
            selectedImg=UIImage(named:photosSub[preSelectedNumber])
            if preSelectedNumber>photosSub.count-1 { preSelectedNumber = 0 }
        case UISwipeGestureRecognizerDirection.left:
            preSelectedNumber -= 1
            selectedImg=UIImage(named:photosSub[preSelectedNumber])
            if preSelectedNumber<0 { preSelectedNumber = photosSub.count-1 }
        default:
            break
        }
        // 表示する画像のインデックスを変更
        imageView.image = selectedImg
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
