//
//  MyLists.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-10-03.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase

class MyLists: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableVW: UITableView!
    var ref: DatabaseReference!
   
    var savedListNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        loadLists()
    }
    
    
    
    
    func loadLists(){
        
        ref.child("lists").observeSingleEvent(of: .value, with: { (snapshot) in
            //Get users lists
            
            for listthing in snapshot.children.allObjects as! [DataSnapshot]{
                let listDict = listthing.value as! NSDictionary
                
                if let testlistName = listDict["listName"]{
                    let listName = listDict["listName"] as! String
                    print(listDict)
                    self.savedListNameArray.append(listName)
                    self.tableVW.reloadData()
                }
                    
                else{
                    print("Error")
                }
                
            }
        })
        {(error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedListNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER2")
        
        cell?.textLabel?.text = savedListNameArray[indexPath.row]
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)  //Slide to delete
    {
        if editingStyle == .delete {
            self.savedListNameArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
}
