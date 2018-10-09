//
//  MyLists.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-10-03.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MyLists: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableVW: UITableView!
    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle!
    var savedListArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        ref.child("lists").observeSingleEvent(of: .value) { (snapshot) in
            //Get users lists
            let value = snapshot.value as? NSDictionary
            print(value)
            
        }
       
            
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER2", for: indexPath)
        return cell
    }
    
}
