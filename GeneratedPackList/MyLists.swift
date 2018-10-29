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
    
    @IBAction func Cross(_ sender: UIButton) {
        popup2.isHidden = true
    }
    @IBAction func newListBtn(_ sender: UIButton) {
        popup2.isHidden = false
    }
    @IBOutlet weak var newListsOutl: UIButton!
    @IBOutlet weak var tableVW: UITableView!
    var ref: DatabaseReference!
   
    @IBOutlet weak var popup2: UIView!
    
    
    var savedListNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popup2.isHidden = true
        ref = Database.database().reference()
        loadLists()
        newListsOutl.layer.cornerRadius = 30
        newListsOutl.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }
    
    
    func loadLists(){
        
                let uid = Auth.auth().currentUser?.uid
                self.ref.child("Users").child(uid!).child("Lists").observeSingleEvent(of: .value, with: { (snapshot) in
                   
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
                let uid = Auth.auth().currentUser?.uid
                self.ref?.child("Users").child(uid!).child("Lists").child(self.keyArray[indexPath.row]).removeValue()
                self.savedListNameArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.keyArray = []
                
            })
        }
    }
    
    //Get ChildbyautoIds
    func getAllKeys(){
        let uid = Auth.auth().currentUser?.uid
        self.ref.child("Users").child(uid!).child("Lists").observeSingleEvent(of: .value, with: { (snapshot) in
            
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
            self.performSegue(withIdentifier: "segue3", sender: self)
        }
    }
    
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue3" {
            if let indexPath = self.tableVW.indexPathForSelectedRow{
                let destination = segue.destination as! ListView
                
                destination.whatList = savedListNameArray[indexPath.row]
            }
        }
    }
    
}
