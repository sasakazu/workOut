//
//  editSetMenu.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/20.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift


class editSetMenu: UIViewController, UITextFieldDelegate {
    
    var currentTextField : UITextField?
    
    var editNamePh:String = ""
    
    var oneKgPh:String = ""
    var oneRepPh:String = ""

    var twoKgPh:String = ""
    var twoRepPh:String = ""

    var threeKgPh:String = ""
    var threeRepPh:String = ""

    var fourKgPh:String = ""
    var fourRepPh:String = ""

    var fiveKgPh:String = ""
    var fiveRepPh:String = ""

//  textField
    @IBOutlet weak var editSetMenu: UITextField!
    
    @IBOutlet weak var editOneKG: UITextField!
    @IBOutlet weak var editOneRep: UITextField!
    
    @IBOutlet weak var editTwoKG: UITextField!
    @IBOutlet weak var editTwoRep: UITextField!
    
    @IBOutlet weak var editThreeKG: UITextField!
    @IBOutlet weak var editThreeRep: UITextField!
    
    @IBOutlet weak var editFourKG: UITextField!
    @IBOutlet weak var editFourRep: UITextField!
    
    @IBOutlet weak var editFiveKG: UITextField!
    @IBOutlet weak var editFiveRep: UITextField!
    
    
//    View
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        editSetMenu.text = editNamePh
        
        editOneKG.text = oneKgPh
        editOneRep.text = oneRepPh

        editTwoKG.text = twoKgPh
        editTwoRep.text = twoRepPh
        
        editThreeKG.text = threeKgPh
        editThreeRep.text = threeRepPh
        
        editFourKG.text = fourKgPh
        editFourRep.text = fourRepPh
        
        editFiveKG.text = fiveKgPh
        editFiveRep.text = fiveRepPh
    
        
//        角丸
        view1.layer.cornerRadius = 5.0
        view2.layer.cornerRadius = 5.0
        view3.layer.cornerRadius = 5.0
        view4.layer.cornerRadius = 5.0
        view5.layer.cornerRadius = 5.0
        
//        影・ぼかし
        
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOpacity = 0.3
        view1.layer.shadowOffset = CGSize(width: 3, height: 3)
        view1.layer.shadowRadius = 5
        
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOpacity = 0.3
        view2.layer.shadowOffset = CGSize(width: 3, height: 3)
        view2.layer.shadowRadius = 5
        
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOpacity = 0.3
        view3.layer.shadowOffset = CGSize(width: 3, height: 3)
        view1.layer.shadowRadius = 5
        
        view4.layer.shadowColor = UIColor.black.cgColor
        view4.layer.shadowOpacity = 0.3
        view4.layer.shadowOffset = CGSize(width: 3, height: 3)
        view4.layer.shadowRadius = 5
        
        view5.layer.shadowColor = UIColor.black.cgColor
        view5.layer.shadowOpacity = 0.3
        view5.layer.shadowOffset = CGSize(width: 3, height: 3)
        view5.layer.shadowRadius = 5
        
        editSetMenu.delegate = self
        
        editOneKG.delegate = self
        editOneRep.delegate = self
        editTwoKG.delegate = self
        editTwoRep.delegate = self
        editThreeKG.delegate = self
        editThreeRep.delegate = self
        editFourKG.delegate = self
        editFourRep.delegate = self
        editFiveKG.delegate = self
        editFiveRep.delegate = self
        
        
    }
    
    
    
    @IBAction func editDone(_ sender: Any) {
        
        let realm = try! Realm()
        
        let editMenus = realm.objects(SetMenu.self).filter( "setName == %@", editNamePh )
        
        if let editMenu = editMenus.first
        {
            
            
            try! realm.write {
                
                editMenu.setName = editSetMenu.text!
                
                editMenu.oneKG = editOneKG.text!
                editMenu.oneRep = editOneRep.text!
                editMenu.twoKG = editTwoKG.text!
                editMenu.twoRep = editTwoRep.text!
                editMenu.threeKG = editThreeKG.text!
                editMenu.threeRep = editThreeRep.text!
                editMenu.fourKG = editFourKG.text!
                editMenu.fourRep = editFourRep.text!
                editMenu.fiveKG = editFiveKG.text!
                editMenu.fiveRep = editFiveRep.text!
                
                print("2回目成功だよ", editMenu)
                
                
            }
            
        }
        
        navigationController?.popToRootViewController(animated: true)
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
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
        
        currentTextField = textField
        
        let left = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(tapLeft))
        let right = UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(tapRight))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDone))
        
        toolBar.items = [left, right, space, done]
        
        textField.inputAccessoryView = toolBar
        
        return true
    }
    
    @objc func tapDone(){
        self.view.endEditing(true)
    }
    
    @objc func tapLeft(){
        guard let tag = currentTextField?.tag, let nextTextField = self.view.viewWithTag(tag - 1) else{
            return
        }
        nextTextField.becomeFirstResponder()
    }
    
    @objc func tapRight(){
        guard let tag = currentTextField?.tag, let nextTextField = self.view.viewWithTag(tag + 1) else {
            return
        }
        nextTextField.becomeFirstResponder()
    }
    

    
    
  

}
