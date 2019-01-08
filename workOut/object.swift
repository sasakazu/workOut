//
//  object.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/08.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import Foundation
import RealmSwift



class SetMenu: Object {
    
    @objc dynamic var order = 0
    
    @objc dynamic var setName = ""
    
    @objc dynamic var oneKG = ""
    @objc dynamic var oneRep = ""
    
    @objc dynamic var twoKG = ""
    @objc dynamic var twoRep = ""
    
    @objc dynamic var threeKG = ""
    @objc dynamic var threeRep = ""
    
    @objc dynamic var fourKG = ""
    @objc dynamic var fourRep = ""
    
    @objc dynamic var fiveKG = ""
    @objc dynamic var fiveRep = ""
    

    
}

