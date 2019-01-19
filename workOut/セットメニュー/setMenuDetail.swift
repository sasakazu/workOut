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
