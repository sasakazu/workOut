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
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = setMenuItem[indexpath.row]
        
        cell.textLabel?.text = object.setName
        
        return cell
        
        
    }
    
    
    
    
    
  
}
