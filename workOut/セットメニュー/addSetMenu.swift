//
//  addSetMenu.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/06.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift


class addSetMenu: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var setNameTF: UITextField!
    
    @IBOutlet weak var oneKGTF: UITextField!
    @IBOutlet weak var oneRepTF: UITextField!
   
    @IBOutlet weak var twoKGTF: UITextField!
    @IBOutlet weak var twoRepTF: UITextField!
    
    @IBOutlet weak var threeKGTF: UITextField!
    @IBOutlet weak var threeRepTF: UITextField!
    
    @IBOutlet weak var fourKGTF: UITextField!
    @IBOutlet weak var fourRepTF: UITextField!
    
    @IBOutlet weak var fiveKGTF: UITextField!
    @IBOutlet weak var fiveRepTF: UITextField!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        

        setNameTF.delegate = self
     
        oneKGTF.delegate = self
        oneRepTF.delegate = self
        twoKGTF.delegate = self
        twoRepTF.delegate = self
        threeKGTF.delegate = self
        threeRepTF.delegate = self
        fourKGTF.delegate = self
        fourRepTF.delegate = self
        fiveKGTF.delegate = self
        fiveRepTF.delegate = self
        
        
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        
        let newSetMenu = SetMenu()
        
        newSetMenu.setName = setNameTF.text!
        
        newSetMenu.oneKG = oneKGTF.text!
        newSetMenu.oneRep = oneRepTF.text!
        
        newSetMenu.twoKG = twoKGTF.text!
        newSetMenu.twoRep = twoRepTF.text!
        
        newSetMenu.threeKG = threeKGTF.text!
        newSetMenu.threeRep = threeRepTF.text!
        
        newSetMenu.fourKG = fourKGTF.text!
        newSetMenu.fourRep = fourRepTF.text!
        
        newSetMenu.fiveKG = fiveKGTF.text!
        newSetMenu.fiveRep = fiveRepTF.text!
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newSetMenu)
                print("成功！！")
                
            })
        }catch{
            print("失敗！！！")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    

}
