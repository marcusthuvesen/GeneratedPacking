//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework
class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    //REASONS-LISTOR
    
    var travelAbroad = ["GOING ABROAD", "Passport", "Visa Documents", "Insurance Documents", "Transportation Tickets", "Cash", "Travel Adapter", ""]
    
    var baseListMan = ["TOILETRIES", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Shaving Gel", "Razor", "Cotton Swabs", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contacts", "Contact Fluid", "Ear Plugs", "Plasters", "--BASIC CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt/Shirt", "Jacket", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book/E-book", "Phone", "Phone Charger", "Headphones", "Wallet", ""]
    
    var baseListWoman = ["TOILETRIES", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Conditioner", "Shaving Gel", "Razor", "Cotton Swabs", "Make-up", "Make-up Remover", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contacts", "Contact Fluid", "Ear Plugs", "Plasters", "Sanitary Products", "--BASIC CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt/Shirt", "Bra/Sports Bra", "Jacket", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book/E-book", "Phone", "Phone Charger", "Headphones", "Wallet", ""]
    
    var businessObjectsMan = ["BUSINESS", "--FOOTWEAR/CLOTHING--", "Walking Shoes/Sneakers", "Dress Shoes", "Suit", "Shirt", "Tie", "Costume Socks", "--ACCESSORIES--", "Briefcase", "Laptop", "Laptop Charger", "Work Cell Phone", "Work Cell Phone Charger", "Business Cards", ""]
    var businessObjectsWoman = ["BUSINESS", "--FOOTWEAR/CLOTHING--", "Walking Shoes/Sneakers", "Dress Shoes/High Heels", "Business Attire", "--ACCESSORIES--", "Briefcase", "Laptop", "Laptop Charger", "Work Cell Phone", "Work Cell Phone Charger", "Business Cards", ""]
    var sunBeachObjectsMan = ["BEACH/SWIM","--FOOTWEAR/CLOTHING--", "Flip Flops/Sandals", "Water Shoes", "Cover up Clothing", "Swimwear", "Shorts/Beachwear", "Sun Hat", "--ACCESSORIES--", "Beach Bag", "Beach Towel", "Sunscreen", "Aftersun", "Floatie", "Sunhat", "SunGlasses", "Portable Speaker", "Fins & Snorkel Gear", "Frisbee or Beach Games", ""]
    
    var sunBeachObjectsWoman = ["BEACH/SWIM","--FOOTWEAR/CLOTHING--", "Flip Flops/Sandals", "Water Shoes", "Cover up Clothing", "Swimwear", "Shorts/Beachwear", "Sun Hat", "--ACCESSORIES--", "Beach Bag", "Beach Towel", "Sunscreen", "Aftersun", "Floatie", "Sunhat", "SunGlasses", "Portable Speaker", "Fins & Snorkel Gear", "Frisbee or Beach Games", ""]
    
    var cityObjectsMan = ["CITY", "City Map", "Walking Shoes", "Day Backpack", ""]
    var cityObjectsWoman = ["CITY", "City Map", "Walking Shoes", "Day Backpack/Purse", "" ]
    
    var skiingObjectsMan = ["SKIING","--FOOTWEAR/CLOTHING--", "Winter Boots", "Ski/Snowboard Boots", "Warm Hat/Beanie", "Thermal Top", "Thermal Bottoms", "Fleece", "Ski/Snowboard Jacket", "Ski/Snowboard Trousers", "Gloves", "Comfy Trousers", "Scarf", "--ACCESSORIES-", "Ski Goggles", "Sunscreen", ""]
    var skiingObjectsWoman = ["SKIING","--FOOTWEAR/CLOTHING--", "Winter Boots", "Ski/Snowboard Boots", "Warm Hat/Beanie", "Thermal Top", "Thermal Bottoms", "Fleece", "Ski/Snowboard Jacket", "Ski/Snowboard Trousers", "Gloves", "Comfy Trousers", "Scarf", "--ACCESSORIES--", "Ski Goggles", "Sunscreen", ""]
    
    var trainingObjectsMan = ["TRAINING", "Training Shoes", "Joggers/Shorts", "Training Socks", "Water Bottle" ]
    var trainingObjectsWoman = ["TRAINING","Training Shoes", "Joggers/Shorts/Tights", "Training Socks", "Water Bottle"]
   
    
    var partyObjectsMan = ["PARTY", "--FOOTWEAR/CLOTHING--", "Flat Shoes", "Walking Shoes", "Outfit For going out", "Comfy Outfit", "--ACCESSORIES--", "Hairdryer", "Speakers", "Playing Cards"  ]
    var partyObjectsWoman = ["PARTY", "--FOOTWEAR/CLOTHING--", "Dressy Flats", "Walking shoes", "Party Outfit", "Comfy Outfit", "--ACCESSORIES--", "Hairdryer", "Hair straighteners/curlers", "Jewellery", "Speakers", "Playing Cards"]

    var generatedObjects = [String]()
    
    var chosen1 = false
    var chosen2 = false
    var chosen3 = false
    var chosen4 = false
    var chosen5 = false
    var chosen6 = false
    var emptylist = false
    var firstSave = false
    var sliderString : String = ""
    var savedListNames = [String]()
    var whatList : String?
    var currentListKey : String?
    var keyArray = [String]()
    let uid = Auth.auth().currentUser?.uid
    let myOrangeColor = UIColor(red: 255/255.0, green: 161/255.0, blue: 63/255.0, alpha: 1.0)
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var listNameText: UITextField!
    @IBOutlet weak var hideSaveBtn: UIButton!
    @IBOutlet weak var newListOutl: UIButton!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var inputAddText: UITextField!
    @IBOutlet weak var myListsOutl: UIButton!
    
    @IBOutlet weak var popupViewOutl: UIView!
    
    @IBAction func unwindToLV(segue:UIStoryboardSegue) { }

    override func viewDidAppear(_ animated: Bool) {
        if emptylist == true{
            
            newEmptyList(self)
            emptylist = false
        }
        if whatList != nil{
            SVProgressHUD.show()
            listNameText.text = whatList
            self.generatedObjects.removeAll()
            self.table.reloadData()
            
            let uid = Auth.auth().currentUser?.uid
            ref.child("Users").child(uid!).child("Lists").child(listNameText.text!).observe(.childAdded) { (snapshot) in
                let result = snapshot.value as? [String: Any]
                
                let item = result!["Itemname"]
                if item != nil{
                    self.generatedObjects.append(item as! String)
                }
                self.table.reloadData()
            }
           SVProgressHUD.dismiss()
        }
        
    }
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getAllKeys()
        popupView.isHidden = true
        popupViewOutl.layer.cornerRadius = 10
        popupViewOutl.clipsToBounds = true
        ref = Database.database().reference()
        self.hideKeyboardWhenTappedAround()
        hideSaveBtn.isHidden = true
      
        listNameText.layer.cornerRadius = 5
        popupView.layer.cornerRadius = 10
        newListOutl.layer.cornerRadius = 30
        newListOutl.layer.maskedCorners = [.layerMinXMinYCorner]
       // isUserLoggedIn()
       
        
        
        let gender = UserDefaults.standard.integer(forKey: "genderSelected")
        print(gender)
        
        let sliderValue = UserDefaults.standard.integer(forKey: "sliderValue")
        print(sliderValue)
        
        let travelValue = UserDefaults.standard.bool(forKey: "travelValue")
        
        sliderString = String(sliderValue)
        if sliderValue > 1{
            var underWearValue = "Underwear x \(sliderString)"
            var socksValue = "Socks x \(sliderString)"
            var TshirtValue = "T-shirt x \(sliderString)"
            var shirtValue = "Shirt x \(sliderString)"
            var costumeSocks = "Costume Socks x \(sliderString)"
            if gender == 1{
                baseListMan.insert(underWearValue, at: 20)
                baseListMan.remove(at: 21)
                baseListMan.insert(socksValue, at: 21)
                baseListMan.remove(at: 22)
                baseListMan.insert(TshirtValue, at: 23)
                baseListMan.remove(at: 24)
                businessObjectsMan.insert(shirtValue, at: 5)
                businessObjectsMan.remove(at: 6)
                businessObjectsMan.insert(costumeSocks, at: 7)
                businessObjectsMan.remove(at: 8)
            }else if gender == 2{
                baseListWoman.insert(underWearValue, at: 20)
                baseListWoman.remove(at: 21)
                baseListWoman.insert(socksValue, at: 21)
                baseListWoman.remove(at: 22)
                baseListWoman.insert(TshirtValue, at: 23)
                baseListWoman.remove(at: 24)
            }
        }
        //TRAVEL ABROAD
        if travelValue == true{
            generatedObjects += travelAbroad
        }
        
        
        //BUSINESS
        if chosen1 == true && gender == 1 {
            generatedObjects += businessObjectsMan
            print("Business print MAN")
            
        }
        else if chosen1 == true && gender == 2 {
            generatedObjects += businessObjectsWoman
            print("Business print WOMAN")
        }
        
        //SUNBEACH
        
        if chosen2 == true && gender == 1 {
            generatedObjects += sunBeachObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen2 == true && gender == 2 {
            generatedObjects += sunBeachObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //CITY
        
        if chosen3 == true && gender == 1 {
            generatedObjects += cityObjectsMan
            print("city print MAN")
            
        }
        else if chosen3 == true && gender == 2 {
            generatedObjects += cityObjectsWoman
            print("city print WOMAN")
        }
        
        //SKIING
        
        if chosen4 == true && gender == 1 {
            generatedObjects += skiingObjectsMan
            print("skiing print MAN")
            
        }
        else if chosen4 == true && gender == 2 {
            generatedObjects += skiingObjectsWoman
            print("skiing print WOMAN")
        }
        
        //TRAINING
        if chosen5 == true && gender == 1 {
            generatedObjects += trainingObjectsMan
            print("training print MAN")
            
        }
        else if chosen5 == true && gender == 2 {
            generatedObjects += trainingObjectsWoman
            print("training print WOMAN")
        }
        
        if chosen6 == true && gender == 1 {
            generatedObjects += partyObjectsMan
            print("party print MAN")
            
        }
        else if chosen6 == true && gender == 2 {
            generatedObjects += partyObjectsWoman
            print("party print WOMAN")
        }
        
        //Baselist
        if(gender == 1){
            print("DU HAMNADE I BASLISTAN")
            generatedObjects += baseListMan
        }
            //emptyList == false &&
        else if(gender == 2){
            generatedObjects += baseListWoman
        }
        
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func myListsBtn(_ sender: Any) {
        performSegue(withIdentifier: "MyLists", sender: self)
    }
    
    @IBAction func generateBtn(_ sender: Any) {
        performSegue(withIdentifier: "generateNew1", sender: self)
    }
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        listNameText.backgroundColor = UIColor(white: 1, alpha: 0)
        hideSaveBtn.isHidden = true
        myListsOutl.isHidden = false
        listNameText.placeholder = "Tap To Add Listname"
        listNameText.textColor = .white
        listNameText.resignFirstResponder()
        
        
        
        if listNameText.text != "" {
            SVProgressHUD.show(withStatus: "Saving")
            
            //Hitta ID för currentUser och spara listan under List
            
            for i in 0 ..< generatedObjects.count{
                ref.child("Users").child(self.uid!).child("Lists").child(listNameText.text!).childByAutoId().child("Itemname").setValue(generatedObjects[i])
                
            }
            self.generatedObjects.removeAll()
            self.table.reloadData()
            
            ref.child("Users").child(self.uid!).child("Lists").child(listNameText.text!).observe(.childAdded) { (snapshot) in
                let result = snapshot.value as? [String: Any]
                
                let item = result!["Itemname"]
                
                self.generatedObjects.append(item as! String)
                self.table.reloadData()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    SVProgressHUD.dismiss()
                }
            }
            
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
                print("här hamnade du")
                
                //Hitta ID för användaren och spara in Added Item in the list
                
                ref.child("Users").child(uid!).child("Lists").child(listNameText.text!).childByAutoId().child("Itemname").setValue(inputAddText.text)
                inputAddText.text = ""
                
            }
            if listNameText.text == ""{
                print("eller här")
                print("ingen titel finns")
                generatedObjects.append(inputAddText.text!)
                inputAddText.text = ""
                table.reloadData()
            }
            
            self.table.scrollToRow(at: IndexPath(row: self.generatedObjects.count-1, section: 0), at: .bottom, animated: true)
        }
        
    }
    
    
    @IBAction func popupExitBtn(_ sender: UIButton) {
        popupView.isHidden = true
    }
    
    @IBAction func newEmptyList(_ sender: Any) {
        
        generatedObjects.removeAll()
        listNameText.text = ""
        table.reloadData()
        popupView.isHidden = true
    }
    
    @IBAction func newListBtn(_ sender: UIButton) {
        popupView.isHidden = false
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
            
            print(listNameText.text)
            if listNameText.text != ""{
                getAllKeys()
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when, execute:{
                    self.ref.child("Users").child(self.uid!).child("Lists").child(self.listNameText.text!).child(self.keyArray[indexPath.row]).removeValue()
                    self.generatedObjects.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    self.keyArray = []
                    
                })
            }else{
                //Om inget listnamn finns
                self.generatedObjects.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Force your tableview margins (this may be a bad idea)
        if table.responds(to: #selector(setter: UITableView.separatorInset)) {
            table.separatorInset = .zero
        }
        if table.responds(to: #selector(setter: UITableView.layoutMargins)) {
            table.layoutMargins = .zero
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return generatedObjects.count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath) as! ListViewTableViewCell
        let myCustomColor = UIColor(red: 91/255.0, green: 168/255.0, blue: 184/255.0, alpha: 1.0)
        if let colour = myCustomColor.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(generatedObjects.count + 5)){
            cell.backgroundColor = colour
            cell.contentView.backgroundColor = colour
            cell.textLabel?.backgroundColor = colour
            
        }
        cell.textLabel?.text = generatedObjects[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 20.0)
        
        if String(generatedObjects[indexPath.row]) == "TOILETRIES" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
            
        }
        if String(generatedObjects[indexPath.row]) == "BUSINESS" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "BEACH/SWIM" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "CITY" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "SKIING" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "TRAINING" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "PARTY" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        if String(generatedObjects[indexPath.row]) == "GOING ABROAD" {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 27.0)
        }
        
        
        return cell
        
    }
    
    // Kolla om användaren är inloggad
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
}
