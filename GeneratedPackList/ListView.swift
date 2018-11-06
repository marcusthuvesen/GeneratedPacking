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
   //REASONS-LISTOR
    
    var travelAbroad = ["Travel Adapter"]
    
    var baseListMan = ["TOILETRIES", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Shaving Gel", "Razor", "Cotton Swabs", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contacts", "Contact Fluid", "Ear Plugs", "Plasters", "--BASIC CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt/Shirt", "Jacket", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book/E-book", "Phone", "Phone Charger", "Headphones", "Wallet", ""]
    var baseListWoman = ["TOILETRIES", "Toiletry Bag", "Toothbrush", "Toothpaste", "Deodorant", "Comb", "Shampoo", "Conditioner", "Shaving Gel", "Razor", "Cotton Swabs", "Make-up", "Make-up Remover", "Nail Clippers", "Dental Floss", "Perfume", "Medication", "Glasses", "Contacts", "Contact Fluid", "Ear Plugs", "Plasters", "Sanitary Products", "--CLOTHES--", "Underwear", "Socks", "Pajamas/Sleepwear", "T-shirt/Shirt", "Bra/Sports Bra", "Jacket", "", "--ACCESSORIES--", "Belt", "Watch", "Pen", "Book/E-book", "Phone", "Phone Charger", "Headphones", "Wallet", ""]
    var businessObjectsMan = ["BUSINESSS", "--Footwear/Clothing--", "Walking Shoes/Sneakers", "Dress Shoes", "Suit", "Shirt", "Tie", "Costume Socks", "--Business Accessories--", "Briefcase", "Laptop", "Laptop Charger", "Work Cell Phone", "Work Cell Phone Charger", "Business Cards", ""]
    var businessObjectsWoman = ["BUSINESSS", "--Footwear/Clothing--", "Walking Shoes/Sneakers", "Dress Shoes/High Heels", "Business Attire", "--Business Accessories--", "Briefcase", "Laptop", "Laptop Charger", "Work Cell Phone", "Work Cell Phone Charger", "Business Cards", ""]
    var sunBeachObjectsMan = ["BEACH/SWIM","--Beach Clothing--", "Cover up Clothing", "Swimwear", "Shorts/Beachwear", "Sun Hat", "--Beach shoes--", "Flip Flops/Sandals", "Water Shoes", "--Beach Accessories--", "Beach Bag", "Beach Towel", "Sunscreen", "Aftersun", "Floatie", "Sunhat", "SunGlasses", "Portable Speaker", "Fins & Snorkel Gear", "Frisbee or Beach Games", ""]
    var sunBeachObjectsWoman = ["BEACH/SWIM","--Beach Clothing--", "Cover up Clothing", "Swimwear", "Shorts", "Sun Hat", "--Beach shoes--", "Flip Flops/Sandals", "Water Shoes", "--Beach Accessories--", "Beach Bag", "Beach Towel", "Sunscreen", "Aftersun", "Floatie", "Sunhat", "SunGlasses", "Portable Speaker", "Fins & Snorkel Gear", "Frisbee or Beach Games", ""]
    
    var cityObjectsMan = ["CITY", "City Map", "Walking Shoes", "Day Backpack", ""]
    var cityObjectsWoman = ["CITY", "City Map", "Walking Shoes", "Day Backpack/Purse", "" ]
   
    var skiingObjectsMan = ["SKIING","--Footwear/Clothing--", "Winter Boots", "Ski/Snowboard Boots", "Warm Hat/Beanie", "Thermal Top", "Thermal Bottoms", "Fleece", "Ski/Snowboard Jacket", "Ski/Snowboard Trousers", "Gloves", "Comfy Trousers", "Scarf", "--Accesories--", "Ski Goggles", "Sunscreen", ""]
    var skiingObjectsWoman = ["SKIING","--Footwear/Clothing--", "Winter Boots", "Ski/Snowboard Boots", "Warm Hat/Beanie", "Thermal Top", "Thermal Bottoms", "Fleece", "Ski/Snowboard Jacket", "Ski/Snowboard Trousers", "Gloves", "Comfy Trousers", "Scarf", "--Accesories--", "Ski Goggles", "Sunscreen", ""]
    
    var trainingObjectsMan = ["TRAINING", "Training Shoes", "Joggers/Shorts", "Training Socks", "Water Bottle" ]
    var trainingObjectsWoman = ["TRAINING","Training Shoes", "Joggers/Shorts/Tights", "Training Socks", "Water Bottle"]
    
   /* var hikingObjectsMan = ["--HIKINGSTUFF--", "--Gear--", "Backpack", "Sleepingbag", "Sleeping Mat", "Walking Sticks", "Map", "Compass", "First Aid", "Lighter/Matches", "Hand Sanitizer", "Insect Repellent", "Toilet Paper", "Knife/Multi-tool", "Headlamp/Flashlight + Batteries", "Water Bottle", "Water Purifier", "--Clothing/Footwear--","Hiking Shoes", "Comfy Shoes", "Moisture-wicking underwear",  "Socks", "Moisture-wicking T-shirt", "Long-sleeve shirt", ""]
    var hikingObjectsWoman = ["--HIKINGSTUFF--", "Walking Stick", ""]*/
    
    var partyObjectsMan = ["---PARTYSTUFF---", "Footwear/Clothes", "Flat Shoes", "Walking Shoes", "Outfit For going out", "Comfy Outfit", "--Accessories--", "Hairdryer", "Speakers", "Playing Cards"  ]
    var partyObjectsWoman = ["PARTYSTUFF", "--Footwear/Clothes--", "Dressy Flats", "Walking shoes", "Party Outfit", "Comfy Outfit", "--Accesssories--", "Hairdryer", "Hair straighteners/curlers", "Jewellery", "Speakers", "Playing Cards"]
    
    /*var campingObjectsMan = ["CAMPINGSTUFF", ""]
    var campingObjectsWoman = ["CAMPINGSTUFF", ""]*/
   //WEATHER-LISTOR
    
    var hotObjects = ["--FOR HOT CLIMATE--", "Hat", "Water"]
    var mildObjects = ["--FOR HOT MILD CLIMATE--",]
    var coldObjects = ["--FOR COLD CLIMATE--", "Warm Jacket", "Jumper/Hoodie", "Gloves", "Headwear", "Warm Socks", "Warm Shoes/boots"]
    var rainyObjects = ["--FOR RAINY CLIMATE--", "Rain Coat", "Umbrella"]
    
    
    
    
    var generatedObjects = [String]()
    
    var weatherHot = false
    var weatherMild = false
    var weatherCold = false
    var weatherRainy = false
    var chosen1 = false
    var chosen2 = false
    var chosen3 = false
    var chosen4 = false
    var chosen5 = false
    var chosen6 = false
    
    var firstSave = false
    var sliderString : String = ""
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
    
   @IBAction func unwindToLV(segue:UIStoryboardSegue) { }
  
    override func viewDidAppear(_ animated: Bool) {
        
        if whatList != nil{
        listNameText.text = whatList
        self.generatedObjects.removeAll()
        self.table.reloadData()
        
         let uid = Auth.auth().currentUser?.uid
        ref.child("Users").child(uid!).child("Lists").child(listNameText.text!).observe(.childAdded) { (snapshot) in
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
        
        
     
            let gender = UserDefaults.standard.integer(forKey: "genderSelected")
            print(gender)
            
            let sliderValue = UserDefaults.standard.integer(forKey: "sliderValue")
            print(sliderValue)
            
             sliderString = String(sliderValue)
            if sliderValue > 1{
                var underWearValue = "Underwear x \(sliderString)"
                var socksValue = "Socks x \(sliderString)"
                var TshirtValue = "T-shirt x \(sliderString)"
                var shirtValue = "Shirt x \(sliderString)"
                var costumeSocks = "Costume Socks x \(sliderString)"
                if gender == 1{
                    baseListMan.insert(underWearValue, at: 19)
                    baseListMan.remove(at: 20)
                    baseListMan.insert(socksValue, at: 20)
                    baseListMan.remove(at: 21)
                    baseListMan.insert(TshirtValue, at: 22)
                    baseListMan.remove(at: 23)
                    businessObjectsMan.insert(shirtValue, at: 6)
                    businessObjectsMan.remove(at: 7)
                    businessObjectsMan.insert(costumeSocks, at: 6)
                    businessObjectsMan.remove(at: 9)
                }else if gender == 2{
                    baseListWoman.insert(underWearValue, at: 19)
                    baseListWoman.remove(at: 20)
                    baseListWoman.insert(socksValue, at: 20)
                    baseListWoman.remove(at: 21)
                    baseListWoman.insert(TshirtValue, at: 22)
                    baseListWoman.remove(at: 23)
                }
            }
            //WEATHER
            if weatherHot == true {
                generatedObjects += hotObjects
            }
            if weatherMild == true {
                generatedObjects += mildObjects
            }
            if weatherCold == true {
                generatedObjects += coldObjects
            }
            if weatherRainy == true {
                generatedObjects += rainyObjects
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
           /* //HIKING
            if chosen6 == true && gender == true {
                generatedObjects += hikingObjectsMan
                print("hiking print MAN")
                
            }
            else if chosen6 == true && gender == false {
                generatedObjects += hikingObjectsWoman
                print("hiking print WOMAN")
            }*/
            
            //PARTY
        
            /*//CAMPING
            
            if chosen8 == true && gender == true {
                generatedObjects += campingObjectsMan
                print("camping print MAN")
                
            }
            else if chosen8 == true && gender == false {
                generatedObjects += campingObjectsWoman
                print("camping print WOMAN")
            }*/
            
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
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        listNameText.backgroundColor = UIColor(white: 1, alpha: 0)
        hideSaveBtn.isHidden = true
        myListsOutl.isHidden = false
        listNameText.placeholder = "Tap To Add Listname"
        listNameText.textColor = .white
        listNameText.resignFirstResponder()
        
        
        
        if listNameText.text != "" {
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
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Remove seperator inset
      /*  if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        // Prevent the cell from inheriting the Table View's margin settings
        if cell.responds(to: #selector(setter: UITableViewCell.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
        // Explictly set your cell's layout margins
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }*/
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
        if String(generatedObjects[indexPath.row]) == "TOILETRIES" {
            cell.textLabel?.textAlignment = .center
        }
        if String(generatedObjects[indexPath.row]) == "BUSINESS" {
            cell.textLabel?.textAlignment = .center
        }
        if String(generatedObjects[indexPath.row]) == "BEACH/SWIM" {
            cell.textLabel?.textAlignment = .center
        }
        if String(generatedObjects[indexPath.row]) == "CITY" {
            cell.textLabel?.textAlignment = .center
        }
        if String(generatedObjects[indexPath.row]) == "SKIING" {
            cell.textLabel?.textAlignment = .center
        }
        if String(generatedObjects[indexPath.row]) == "TRAINING" {
            cell.textLabel?.textAlignment = .center
        }
        else{
            cell.textLabel?.textAlignment = .left
        }
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = generatedObjects[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
}

