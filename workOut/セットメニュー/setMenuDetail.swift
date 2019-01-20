//
//  setMenuDetail.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/19.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class setMenuDetail: UIViewController {
    
    
    @IBOutlet weak var trainingName: UILabel!
    @IBOutlet weak var firstKG: UILabel!
    @IBOutlet weak var firstRep: UILabel!
    @IBOutlet weak var secondKG: UILabel!
    @IBOutlet weak var secondRep: UILabel!
    @IBOutlet weak var thirdKG: UILabel!
    @IBOutlet weak var thirdRep: UILabel!
    @IBOutlet weak var fourthKG: UILabel!
    @IBOutlet weak var fourthRep: UILabel!
    @IBOutlet weak var fifthKG: UILabel!
    @IBOutlet weak var fifthRep: UILabel!
    
    @IBOutlet weak var viewLayer1: UIView!
    
    @IBOutlet weak var viewLayer2: UIView!
    
    @IBOutlet weak var viewLayer3: UIView!
    
    @IBOutlet weak var viewLayer4: UIView!
    
    @IBOutlet weak var viewLayer5: UIView!
    
    
    //    受け変数
    var TRAININGName:String = ""
    
    var FIRSTKG:String = ""
    var FIRSTRep:String = ""
    
    var SECONDKG:String = ""
    var SECONDRep:String = ""
    
    var THIRDKG:String = ""
    var THIRDRep:String = ""
    
    var FOURTHKG:String = ""
    var FOURTHRep:String = ""
    
    var FIFTHKG:String = ""
    var FIFTHRep:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLayer1.layer.cornerRadius = 5.0
        
        viewLayer2.layer.cornerRadius = 5.0
        
        viewLayer3.layer.cornerRadius = 5.0
        
        viewLayer4.layer.cornerRadius = 5.0
        
        viewLayer5.layer.cornerRadius = 5.0
        
//        影・ぼかし
        
        
        viewLayer1.layer.shadowColor = UIColor.black.cgColor
        viewLayer1.layer.shadowOpacity = 0.5
        viewLayer1.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewLayer1.layer.shadowRadius = 5
        
        
        
        viewLayer2.layer.shadowColor = UIColor.black.cgColor
        viewLayer2.layer.shadowOpacity = 0.5
        viewLayer2.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewLayer2.layer.shadowRadius = 5
        
        viewLayer3.layer.shadowColor = UIColor.black.cgColor
        viewLayer3.layer.shadowOpacity = 0.5
        viewLayer3.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewLayer3.layer.shadowRadius = 5
        
        viewLayer4.layer.shadowColor = UIColor.black.cgColor
        viewLayer4.layer.shadowOpacity = 0.5
        viewLayer4.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewLayer4.layer.shadowRadius = 5
        
        viewLayer5.layer.shadowColor = UIColor.black.cgColor
        viewLayer5.layer.shadowOpacity = 0.5
        viewLayer5.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewLayer5.layer.shadowRadius = 5
        
//        表示
        trainingName.text = TRAININGName
        
        firstKG.text = "\(FIRSTKG) Kg"
        firstRep.text = "\(FIRSTRep) Rep"
        
        secondKG.text = "\(SECONDKG) Kg"
        secondRep.text = "\(SECONDRep) Rep"
        
        thirdKG.text = "\(THIRDKG) Kg"
        thirdRep.text = "\(THIRDRep) Rep"
        
        fourthKG.text = "\(FOURTHKG) Kg"
        fourthRep.text = "\(FOURTHRep) Rep"
        
        fifthKG.text = "\(FIFTHKG) Kg"
        fifthRep.text = "\(FIFTHRep) Rep"

      
    }
    

  

}
