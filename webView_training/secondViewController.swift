//
//  secondViewController.swift
//  webView_training
//
//  Created by Takahiro Noguchi on 2016/05/13.
//  Copyright © 2016年 Takahiro Noguchi. All rights reserved.
//

import UIKit

class secondViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate {

    private var myTextField: UITextField!
    private var myUIPicker: UIPickerView!

    private let Value: NSArray = ["X","Rusty Nail","Silent Jeloucy","WeekEnd"]
    
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
        
        //Picker
        myUIPicker = UIPickerView()
        myUIPicker.frame = CGRectMake(0, 0, self.view.bounds.width, 180.0) //サイズ
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        self.view.addSubview(myUIPicker)

        
        //Text
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        //myTextField.text = "Hello World!"
        //myTextField.text = Value[0] as! String
        myTextField.delegate = self
        myTextField.borderStyle = UITextBorderStyle.RoundedRect //枠を表示する
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2 , y: 300)
        self.view.addSubview(myTextField)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int { //表示する列数
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //表示する行数
        return Value.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { //表示する配列の要素
        return Value[row] as? String
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //選択された時に実行される処理
        //print("row : \(row)")
        //print("value : \(Value[row])")
        myTextField.text = Value[row] as! String
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
     ボタンイベント.
     */
    internal func Click(sender: UIButton){
        // 遷移するViewを定義.
        let myViewController: UIViewController = ViewController()
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
}
