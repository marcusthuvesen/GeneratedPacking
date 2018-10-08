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
        
        
        
        ref?.child("List").observe(.childAdded, with: { (snapshot) in
            //Code executed when child is added under "List"
            let post = snapshot.value as? String
            
            if let actualPost = post {
                
                //Append data to savedListArray
                self.savedListArray.append(actualPost)
                
                
                self.tableVW.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER2", for: indexPath)
        return cell
    }
    
}
