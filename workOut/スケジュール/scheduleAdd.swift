//
//  scheduleAdd.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift
//ディスプレイサイズ取得
let w2 = UIScreen.main.bounds.size.width
let h2 = UIScreen.main.bounds.size.height



class scheduleAdd: UIViewController {
    
    
    @IBOutlet weak var eventText: UITextView!
    @IBOutlet weak var y: UIDatePicker!
    @IBOutlet weak var y_text: UILabel!
    
    @IBOutlet weak var eventInsert: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スケジュール内容入力テキスト設定
        eventText.text = ""
        eventText.layer.borderColor = UIColor.gray.cgColor
        eventText.layer.borderWidth = 1.0
        eventText.layer.cornerRadius = 10.0
        
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
        
        eventInsert.setTitle("スケジュールに追加！", for: UIControl.State())
        eventInsert.setTitleColor(.white, for: UIControl.State())
        eventInsert.backgroundColor = .orange
        eventInsert.layer.cornerRadius = 10.0
        eventInsert.addTarget(self, action: #selector(saveEvent(_:)), for: .touchUpInside)
        view.addSubview(eventInsert)
        
//
//        backBtn.setTitle("戻る", for: UIControl.State())
//        backBtn.setTitleColor(.orange, for: UIControl.State())
//        backBtn.backgroundColor = .white
//        backBtn.layer.cornerRadius = 10.0
//        backBtn.layer.borderColor = UIColor.orange.cgColor
//        backBtn.layer.borderWidth = 1.0
//        backBtn.addTarget(self, action: #selector(onbackClick(_:)), for: .touchUpInside)
//        view.addSubview(backBtn)
        
    
    }
    
//    //画面遷移(カレンダーページ)
//    @objc func onbackClick(_: UIButton) {
//        dismiss(animated: true, completion: nil)
//    }
    
    //日付フォーム
    @objc func picker(_ sender:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        y_text.text = formatter.string(from: sender.date)
        view.addSubview(y_text)
    }
    
    //DB書き込み処理
    @objc func saveEvent(_ : UIButton){
        print("データ書き込み開始")
        
        let realm = try! Realm()
        
        try! realm.write {
            //日付表示の内容とスケジュール入力の内容が書き込まれる。
            let Events = [Event(value: ["date": y_text.text, "event": eventText.text])]
            realm.add(Events)
            print("データ書き込み中")
        }
        
        print("データ書き込み完了")
        
        //前のページに戻る
        dismiss(animated: true, completion: nil)
        
    }
    
}


