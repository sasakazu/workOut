//
//  scheduleAdd.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift


class scheduleAdd: UIViewController, UITextFieldDelegate {
    
    var ActivityIndicator: UIActivityIndicatorView!

    
    @IBOutlet weak var eventText: UITextField!
    @IBOutlet weak var y: UIDatePicker!
    @IBOutlet weak var y_text: UILabel!
    
    @IBOutlet weak var eventInsert: UIButton!

    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // ActivityIndicatorを作成＆中央に配置
        ActivityIndicator = UIActivityIndicatorView()
        ActivityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        ActivityIndicator.center = self.view.center
        
        // クルクルをストップした時に非表示する
        ActivityIndicator.hidesWhenStopped = true
        
        // 色を設定
        ActivityIndicator.style = UIActivityIndicatorView.Style.gray
        
        //Viewに追加
        self.view.addSubview(ActivityIndicator)
        
//        角丸
        eventInsert.layer.cornerRadius = 7.0
        
        //スケジュール内容入力テキスト設定
        eventText.text = ""
        eventText.layer.borderColor = UIColor.gray.cgColor
//        eventText.layer.borderWidth = 0.5
        view.addSubview(eventText)
        
        //日付フォーム設定
        y.datePickerMode = UIDatePicker.Mode.date
        y.timeZone = NSTimeZone.local
        y.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        y.addTarget(self, action: #selector(picker(_:)), for: .valueChanged)
        view.addSubview(y)
        
        //日付表示設定
        y_text.backgroundColor = .white
        y_text.textAlignment = .center
        view.addSubview(y_text)
        
        
        eventText.delegate = self
        
    }
    
    //日付フォーム
    @objc func picker(_ sender:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        y_text.text = formatter.string(from: sender.date)
        view.addSubview(y_text)
    }
    
    
    
    
    @IBAction func addEvent(_ sender: Any) {
        
        
        print("データ書き込み開始")
        
        let realm = try! Realm()
        
        try! realm.write {
            //日付表示の内容とスケジュール入力の内容が書き込まれる。
            let Events = [Event(value: ["date": y_text.text, "event": eventText.text])]
            realm.add(Events)
            print("データ書き込み中")
            
            ActivityIndicator.startAnimating()

        }
        
        print("データ書き込み完了")
        

        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        eventText.resignFirstResponder()
        
        return true
    }
    
    
    //    別の場所タップで閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    
    
    //    toolbar
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDone))
        
        toolBar.items = [space, done]
        
        textField.inputAccessoryView = toolBar
        
        return true
    }
    
    @objc func tapDone(){
        self.view.endEditing(true)
    }
    
}


