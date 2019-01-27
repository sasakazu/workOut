//
//  setMenuTable.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/06.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class setMenuTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var setMenuItem: Results<SetMenu>!
    
    
    var trainingName:String = ""
    
    var training1setKG:String = ""
    var training1setRep:String = ""
    
    var training2setKG:String = ""
    var training2setRep:String = ""
    
    var training3setKG:String = ""
    var training3setRep:String = ""
    
    var training4setKG:String = ""
    var training4setRep:String = ""
    
    var training5setKG:String = ""
    var training5setRep:String = ""
    
    
    @IBOutlet weak var setMenuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        setMenuItem = realm.objects(SetMenu.self).sorted(byKeyPath: "order")

        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setMenuTableView.reloadData()
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        return setMenuItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        

        
        if indexpath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexpath)
            

            cell.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexpath)
            
            
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)

            
        }
        
        let object = setMenuItem[indexpath.row]
        
        cell.textLabel?.text = object.setName
        
        return cell
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = setMenuItem[indexPath.row]
        
        trainingName = object.setName
        
        training1setKG = object.oneKG
        training1setRep = object.oneRep
        
        training2setKG = object.twoKG
        training2setRep = object.twoRep
        
        training3setKG = object.threeKG
        training3setRep = object.threeRep
        
        training4setKG = object.fourKG
        training4setRep = object.fourRep
        
        training5setKG = object.fiveKG
        training5setRep = object.fiveRep
        
        performSegue(withIdentifier: "goDetail",sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "goDetail") {
            
            let secondVC: setMenuDetail = (segue.destination as? setMenuDetail)!
            
            secondVC.TRAININGName = trainingName
            
            secondVC.FIRSTKG = training1setKG
            secondVC.FIRSTRep = training1setRep
            
            secondVC.SECONDKG = training2setKG
            secondVC.SECONDRep = training2setRep
            
            secondVC.THIRDKG = training3setKG
            secondVC.THIRDRep = training3setRep
            
            secondVC.FOURTHKG = training4setKG
            secondVC.FOURTHRep = training4setRep
            
            secondVC.FIFTHKG = training5setKG
            secondVC.FIFTHRep = training5setRep
            
            
        }
        
    }
    
    
//    delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.setMenuItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }catch{
                
                
                self.setMenuTableView.reloadData()
            }
        }
    }
    
  
}
