//
//  secondViewController.swift
//  webView_training
//
//  Created by Takahiro Noguchi on 2016/05/13.
//  Copyright © 2016年 Takahiro Noguchi. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // ボタンを作成.
        let backButton: UIButton = UIButton(frame: CGRectMake(0,0,200,80))
        backButton.backgroundColor = UIColor.redColor();
        backButton.layer.masksToBounds = true
        backButton.setTitle("Back", forState: .Normal)
        backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-100)
        backButton.addTarget(self, action: "Click:", forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton);
    }
    
    /*
     ボタンイベント.
     */
    internal func Click(sender: UIButton){
        // 遷移するViewを定義.
        let myViewController: UIViewController = ViewController()
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
}
