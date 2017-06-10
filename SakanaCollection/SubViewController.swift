//
//  SubViewController.swift
//  SakanaCollection
//
//  Created by 新冨健太 on 2017/06/10.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SubViewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
