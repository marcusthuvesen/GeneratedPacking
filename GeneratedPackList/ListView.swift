//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase


class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
   
    var baseListMan = ["--TOILETRIES MAN--", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Shaving Gel", "Razor", "Cotton Swabs", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contact", "Contact Fluid", "", "--CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book", ""]
    
     var baseListWoman = ["--TOILETRIES WOMAN--", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Shaving Gel", "Razor", "Cotton Swabs", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contact", "Contact Fluid", "", "--CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book", ""]
    
    
    var businessObjectsMan = ["BUSINESSSTUFF-MAN", "Tie", "Briefcase", "Work Belt", "Work Socks", "Work Belt", "Business Cards", "Work Cell Phone", "Work Cell Phone Charger", "Laptop", "Laptop Charger", ""]
    var businessObjectsWoman = ["BUSINESSSTUFF-WOMAN", "Work Suit", "Tie", "Briefcase", "Work Belt", "Work Socks", "Work Belt", "Business Cards", "Work Cell Phone", "Work Cell Phone Charger", "Laptop", "Laptop Charger", ""]
    
    var sunBeachObjectsMan = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Sun Screen", "Water", "Beach shoes", "Showe Slippers", ""]
    var sunBeachObjectsWoman = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Sun Screen", "Water", "Beach shoes", "Showe Slippers", ""]
    
    var cityObjectsMan = ["CITYSTUFF", "Map", ""]
    var cityObjectsWoman = ["CITYSTUFF", "Map", ""]
   
    var skiingObjectsMan = ["SKISTUFF", "Ski boots", ""]
    var skiingObjectsWoman = ["SKISTUFF", "Ski boots", ""]
    
    var trainingObjectsMan = ["TRAININGSTUFF", "Joggers", "Running Shoes", ""]
    var trainingObjectsWoman = ["TRAININGSTUFF", "Joggers", "Running Shoes", ""]
    
    var hikingObjectsMan = ["HIKINGSTUFF", "Walking Stick", ""]
    var hikingObjectsWoman = ["HIKINGSTUFF", "Walking Stick", ""]
    
    var partyObjectsMan = ["PARTYSTUFF", ""]
    var partyObjectsWoman = ["PARTYSTUFF", ""]
    
    var campingObjectsMan = ["CAMPINGSTUFF", ""]
    var campingObjectsWoman = ["CAMPINGSTUFF", ""]
    
    var generatedObjects = [String]()
    
    var chosen1 = false
    var chosen2 = false
    var chosen3 = false
    var chosen4 = false
    var chosen5 = false
    var chosen6 = false
    var chosen7 = false
    var chosen8 = false
    var firstSave = false
    
    var savedListNames = [String]()
    var whatList : String?
    var currentListKey : String?
    var keyArray = [String]()
    let uid = Auth.auth().currentUser?.uid
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var listNameText: UITextField!
    @IBOutlet weak var hideSaveBtn: UIButton!
    @IBOutlet weak var newListOutl: UIButton!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var inputAddText: UITextField!
    @IBOutlet weak var myListsOutl: UIButton!
    
    @IBOutlet weak var popupViewOutl: UIView!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        listNameText.backgroundColor = UIColor(white: 1, alpha: 0)
        hideSaveBtn.isHidden = true
        myListsOutl.isHidden = false
        listNameText.placeholder = "Tap To Add Listname"
        listNameText.textColor = .white
        listNameText.resignFirstResponder()
        
        
        if firstSave == true{
            
        }else{
            if listNameText.text != "" {
                //Hitta ID för currentUser och spara listan under List
                //let uid = Auth.auth().currentUser?.uid
                for i in 0 ..< generatedObjects.count{
                    ref.child("Users").child(uid!).child("Lists").child(listNameText.text!).childByAutoId().child("Itemname").setValue(generatedObjects[i])
                    
                }
                table.reloadData()
            }
            firstSave = true
        }
        
    }
    
    @IBAction func listNameTextTouch(_ sender: UITextField) {
        listNameText.backgroundColor = .white
        listNameText.textColor = .black
        listNameText.placeholder = "Add Listname"
        hideSaveBtn.isHidden = false
        myListsOutl.isHidden = true
        
    }
    
    
    @IBAction func addBtn(_ sender: UIButton) {
        
        if inputAddText.text != ""{
           if listNameText.text != "" {
                //Hitta ID för användaren och spara in Added Item in the list
                ref.child("Users").child(uid!).child("Lists").child(listNameText.text!).childByAutoId().child("Itemname").setValue(inputAddText.text)
                inputAddText.text = ""
            }
            if listNameText.text == ""{
                print("hamnade där")
                generatedObjects.append(inputAddText.text!)
                inputAddText.text = ""
            }
            
            table.reloadData()
        }
    }
    
    
    @IBAction func popupExitBtn(_ sender: UIButton) {
        popupView.isHidden = true
    }
    
    @IBAction func newEmptyList(_ sender: UIButton) {
        
        generatedObjects.removeAll()
        listNameText.text = ""
        table.reloadData()
        popupView.isHidden = true
        
        
    }
    
    @IBAction func newListBtn(_ sender: UIButton) {
        popupView.isHidden = false
    }

    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if whatList != nil{
        listNameText.text = whatList
        self.generatedObjects.removeAll()
        self.table.reloadData()
        
         let uid = Auth.auth().currentUser?.uid
        ref.child("Users").child(uid!).child("Lists").child(whatList!).observe(.childAdded) { (snapshot) in
                let result = snapshot.value as? [String: Any]
                
                let item = result!["Itemname"]
            
            self.generatedObjects.append(item as! String)
            self.table.reloadData()
            }
            
        }
        
    }
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getAllKeys()
        popupViewOutl.layer.cornerRadius = 10
        popupViewOutl.clipsToBounds = true
        ref = Database.database().reference()
        self.hideKeyboardWhenTappedAround()
        hideSaveBtn.isHidden = true
        popupView.isHidden = true
        
        listNameText.layer.cornerRadius = 5
        popupView.layer.cornerRadius = 10
        newListOutl.layer.cornerRadius = 30
        newListOutl.layer.maskedCorners = [.layerMinXMinYCorner]
        
        
     
            let gender = UserDefaults.standard.bool(forKey: "genderSelected")
            print(gender)
            
            let sliderValue = UserDefaults.standard.integer(forKey: "sliderValue")
            print(sliderValue)
            
            /*  var sliderString = String(sliderValue)
             var sliderString2 = " Suits"
             var sliderStrings = (sliderString + sliderString2)
             businessObjectsMan.insert(sliderStrings, at: 1)*/
            
            
            //BUSINESS
            if chosen1 == true && gender == true {
                generatedObjects += businessObjectsMan
                print("Business print MAN")
                
            }
            else if chosen1 == true && gender == false {
                generatedObjects += businessObjectsWoman
                print("Business print WOMAN")
            }
            
            //SUNBEACH
            
            if chosen2 == true && gender == true {
                generatedObjects += sunBeachObjectsMan
                print("sunBeach print MAN")
                
            }
            else if chosen2 == true && gender == false {
                generatedObjects += sunBeachObjectsWoman
                print("SunBeach print WOMAN")
            }
            
            //CITY
            
            if chosen3 == true && gender == true {
                generatedObjects += cityObjectsMan
                print("city print MAN")
                
            }
            else if chosen3 == true && gender == false {
                generatedObjects += cityObjectsWoman
                print("city print WOMAN")
            }
            
            //SKIING
            
            if chosen4 == true && gender == true {
                generatedObjects += skiingObjectsMan
                print("skiing print MAN")
                
            }
            else if chosen4 == true && gender == false {
                generatedObjects += skiingObjectsWoman
                print("skiing print WOMAN")
            }
            
            //TRAINING
            if chosen5 == true && gender == true {
                generatedObjects += trainingObjectsMan
                print("training print MAN")
                
            }
            else if chosen5 == true && gender == false {
                generatedObjects += trainingObjectsWoman
                print("training print WOMAN")
            }
            
            //HIKING
            if chosen6 == true && gender == true {
                generatedObjects += hikingObjectsMan
                print("hiking print MAN")
                
            }
            else if chosen6 == true && gender == false {
                generatedObjects += hikingObjectsWoman
                print("hiking print WOMAN")
            }
            
            //PARTY
            
            if chosen7 == true && gender == true {
                generatedObjects += partyObjectsMan
                print("party print MAN")
                
            }
            else if chosen7 == true && gender == false {
                generatedObjects += partyObjectsWoman
                print("party print WOMAN")
            }
            
            //CAMPING
            
            if chosen8 == true && gender == true {
                generatedObjects += campingObjectsMan
                print("camping print MAN")
                
            }
            else if chosen8 == true && gender == false {
                generatedObjects += campingObjectsWoman
                print("camping print WOMAN")
            }
            
            //Baselist
            if(gender == true){
                print("DU HAMNADE I BASLISTAN")
                generatedObjects += baseListMan
            }
                //emptyList == false &&
            else if( gender == false){
                generatedObjects += baseListWoman
            }
            
            // Do any additional setup after loading the view.
        
    }
    
   
    //Get ChildbyautoIds
    func getAllKeys(){
        self.ref.child("Users").child(self.uid!).child("Lists").child(listNameText.text!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                let key = snap.key
                self.keyArray.append(key)
                print(key)
            }
            
            
        })
    }
    
    
   
    //Slide to Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            getAllKeys()
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when, execute:{
                self.ref.child("Users").child(self.uid!).child("Lists").child(self.listNameText.text!).child(self.keyArray[indexPath.row]).removeValue()
                self.generatedObjects.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.keyArray = []
                
            })
        }
    }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return generatedObjects.count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath)
        
        cell.textLabel?.textColor = .black
         cell.textLabel?.text = generatedObjects[indexPath.row]
       
        
        return cell

    }
    
}
