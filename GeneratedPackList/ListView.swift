//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

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
    
 
    
    var chosen1 = false
    var chosen2 = false
    var chosen3 = false
    var chosen4 = false
    var chosen5 = false
    var chosen6 = false
    var chosen7 = false
    var chosen8 = false
    
    
    
    @IBOutlet weak var listLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        let name = UserDefaults.standard.string(forKey: "listNameString")
        print("Det funkar " + (name!))
        listLabel.text = name
        
        let gender = UserDefaults.standard.bool(forKey: "genderSelected")
        print(gender)
        
        let sliderValue = UserDefaults.standard.integer(forKey: "sliderValue")
        print(sliderValue)
        
        var sliderString = String(sliderValue)
        var sliderString2 = " Suits"
        var sliderStrings = (sliderString + sliderString2)
        businessObjectsMan.insert(sliderStrings, at: 1)
        
       
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
            generatedObjects += baseListMan
        }
        else if(gender == false){
            generatedObjects += baseListWoman
        }
        
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func newListBtn(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
    
   
    
    var generatedObjects = [String]()
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)  //Slide to delete
    {
        if editingStyle == .delete {
            self.generatedObjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return generatedObjects.count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath)
        
        
         cell.textLabel?.text = generatedObjects[indexPath.row]
       
        
        return cell

    }
    
}
