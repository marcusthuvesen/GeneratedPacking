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
   var keyArray = [String]()
    
    @IBOutlet weak var tableVW: UITableView!
    var ref: DatabaseReference!
   
    var savedListNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        loadLists()
    }
    
    
    func loadLists(){
        
        
                self.ref.child("lists").child("-LOXr5PoUvBn_tGNhql-").observeSingleEvent(of: .value, with: { (snapshot) in
                   
                    for child in snapshot.children{
                
                        let listName = child as! DataSnapshot
                       let key = listName.key
                        print(key)
                        self.savedListNameArray.append(key)
                        self.tableVW.reloadData()
                    
                    }
                },withCancel: nil)
                    
        
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedListNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER2")
        
        cell?.textLabel?.text = savedListNameArray[indexPath.row]
        
        return cell!
    }
    
    
    //Slide to Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            getAllKeys()
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when, execute:{
                self.ref?.child("lists").child("-LOXr5PoUvBn_tGNhql-").child(self.keyArray[indexPath.row]).removeValue()
                self.savedListNameArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.keyArray = []
                
            })
        }
    }
    
    //Get ChildbyautoIds
    func getAllKeys(){
        ref?.child("lists").child("-LOXr5PoUvBn_tGNhql-").observeSingleEvent(of: .value , with: {(snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                let key = snap.key
                self.keyArray.append(key)
                print(key)
            }
            
            
        })
    }
    
    
    //Selecting List
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let new = tableVW.cellForRow(at: indexPath as IndexPath) {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let indexPath = self.tableVW.indexPathForSelectedRow{
                let destination = segue.destination as! ListView
                
                destination.whatList = savedListNameArray[indexPath.row]
            }
        }
    }
    
}
