//
//  ViewController.swift
//  webView_training
//
//  Created by Takahiro Noguchi on 2016/05/12.
//  Copyright © 2016年 Takahiro Noguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate {

    private var myWebView: UIWebView!
    
    // WebView
    @IBAction func GOyoutube(sender: AnyObject) {
        myWebView = UIWebView() //WebView生成
        myWebView.delegate = self //delegata作成
        myWebView.frame = self.view.bounds //サイズ設定(全画面表示)
        self.view.addSubview(myWebView) //インスタンスをViewに追加
        let url:NSURL = NSURL(string: "https://www.youtube.com/?gl=JP&hl=ja")! //url定義
        let request: NSURLRequest = NSURLRequest(URL: url) //リクエスト作成
        myWebView.loadRequest(request) //リクエスト実行
        
    }
    
    //secondViewへの画面遷移
    @IBAction func SecondView(sender: UIButton) { //secondViewControllerのviewに移動
        let SViewContoroller: UIViewController = secondViewController()
        self.presentViewController(SViewContoroller, animated: true, completion: nil) 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor() //View背後の色を変える

        let myButton: UIButton = UIButton()
        myButton.frame = CGRectMake(0, 0, 200, 40)
        myButton.backgroundColor = UIColor.greenColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("Alert", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2 , y: 200)
        myButton.addTarget(self, action: "AlertClickMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myButton)
 
        let modalButton: UIButton = UIButton()
        modalButton.frame = CGRectMake(0, 0, 200, 40)
        modalButton.backgroundColor = UIColor.blueColor()
        modalButton.layer.masksToBounds = true
        modalButton.setTitle("Modal", forState: UIControlState.Normal)
        modalButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        modalButton.layer.cornerRadius = 20.0
        modalButton.layer.position = CGPoint(x: self.view.frame.width/2 , y: 300)
        modalButton.addTarget(self, action: "ClickMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(modalButton)
    }
    
    //Modal
    internal func ClickMyButton(sender: UIButton) {
        let mySecondViewController: UIViewController = secondViewController() //遷移するview(secondViewContotoller)を指定
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical //アニメーションを指定
        self.presentViewController(mySecondViewController, animated: true, completion: nil) //viewの移動
    }

    //Alert
    internal func AlertClickMyButton(sender: UIButton) {
        let myAlert: UIAlertController = UIAlertController(title: "表示", message: "違法メッセージです", preferredStyle: .Alert) //UIAlertController を作成
        let myOkAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action in
            print("Action OK") //OKのアクションを作成
        }
        myAlert.addAction(myOkAction) //OKのアクションを追加
        presentViewController(myAlert, animated: true, completion: nil) //UIAlertを発動
    }


    func webViewDidFinishLoad(webView: UIWebView) { //Pageがすべて読み込み終わった時呼ばれるデリゲートメソッド.
        print("end")
    }

    func webViewDidStartLoad(webView: UIWebView) { //Pageがloadされ始めた時、呼ばれるデリゲートメソッド.
        print("start")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

