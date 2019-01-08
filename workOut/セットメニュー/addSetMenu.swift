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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
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
    

}
