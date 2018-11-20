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
    
    @IBOutlet weak var logOutOutlet: UIButton!
    
    
    @IBOutlet weak var popup2View: UIView!
    @IBOutlet weak var newListsOutl: UIButton!
    @IBOutlet weak var tableVW: UITableView!
    var ref: DatabaseReference!
   
    @IBOutlet weak var popup2: UIView!
   
    var savedListNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popup2.isHidden = true
        popup2View.layer.cornerRadius = 10
        popup2View.clipsToBounds = true
        ref = Database.database().reference()
        loadLists()
        newListsOutl.layer.cornerRadius = 30
        newListsOutl.layer.maskedCorners = [.layerMinXMinYCorner]
        logOutOutlet.layer.cornerRadius = 10
        logOutOutlet.layer.borderWidth = 1
        logOutOutlet.layer.borderColor = UIColor.white.cgColor
        
    }
    @IBAction func Cross(_ sender: UIButton) {
        popup2.isHidden = true
    }
    @IBAction func newListBtn(_ sender: UIButton) {
        popup2.isHidden = false
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: "is_authenticated")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segueLogOut", sender: self)
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Force your tableview margins (this may be a bad idea)
        if tableVW.responds(to: #selector(setter: UITableView.separatorInset)) {
            tableVW.separatorInset = .zero
        }
        if tableVW.responds(to: #selector(setter: UITableView.layoutMargins)) {
            tableVW.layoutMargins = .zero
        }
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
    @IBAction func generatedBtn2(_ sender: Any) {
        performSegue(withIdentifier: "generateNew2", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
    
    //Selecting List
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let new = tableVW.cellForRow(at: indexPath as IndexPath) {
            performSegue(withIdentifier: "unwindSequeToLV", sender: self)
        }
    }
    
    @IBAction func newEmptyListBtn(_ sender: Any) {
        performSegue(withIdentifier: "NewListSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSequeToLV" {
            if let indexPath = self.tableVW.indexPathForSelectedRow{
                let destination = segue.destination as! ListView
                
                destination.whatList = savedListNameArray[indexPath.row]
            }
        }
       else if segue.identifier == "NewListSegue" {
            print("här")
            let destination = segue.destination as! ListView
            destination.emptylist = true
            destination.whatList = nil
        }
    }
}
