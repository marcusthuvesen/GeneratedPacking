//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
   
    var businessObjectsMan = ["BUSINESSSTUFF-MAN", "Work Suit", "Tie", "Briefcase", "Work Belt", "Work Socks", "Work Belt", "Business Cards", "Work Cell Phone", "Work Cell Phone Charger", "Laptop", "Laptop Charger", ]
    var businessObjectsWoman = ["BUSINESSSTUFF-WOMAN", "Work Suit", "Tie", "Briefcase", "Work Belt", "Work Socks", "Work Belt", "Business Cards", "Work Cell Phone", "Work Cell Phone Charger", "Laptop", "Laptop Charger", ]
    
    var sunBeachObjectsMan = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Sun Screen", "Water", "Beach shoes", "Showe Slippers"]
    var sunBeachObjectsWoman = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Sun Screen", "Water", "Beach shoes", "Showe Slippers"]
    
    var cityObjectsMan = ["CITYSTUFF", "Map"]
    var cityObjectsWoman = ["CITYSTUFF", "Map"]
   
    var skiingObjectsMan = ["SKISTUFF", "Ski boots"]
    var skiingObjectsWoman = ["SKISTUFF", "Ski boots"]
    
    var trainingObjectsMan = ["TRAININGSTUFF", "Joggers", "Running Shoes"]
    var trainingObjectsWoman = ["TRAININGSTUFF", "Joggers", "Running Shoes"]
    
    var hikingObjectsMan = ["HIKINGSTUFF", "Walking Stick"]
    var hikingObjectsWoman = ["HIKINGSTUFF", "Walking Stick"]
    
    var partyObjectsMan = ["PARTYSTUFF"]
    var partyObjectsWoman = ["PARTYSTUFF"]
    
    var campingObjectsMan = ["CAMPINGSTUFF"]
    var campingObjectsWoman = ["CAMPINGSTUFF"]
    
 
    
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
            print("sunBeach print MAN")
            
        }
        else if chosen3 == true && gender == false {
            generatedObjects += cityObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //SKIING
        
        if chosen4 == true && gender == true {
            generatedObjects += skiingObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen4 == true && gender == false {
            generatedObjects += skiingObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //TRAINING
        if chosen5 == true && gender == true {
            generatedObjects += trainingObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen5 == true && gender == false {
            generatedObjects += trainingObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //HIKING
        if chosen6 == true && gender == true {
            generatedObjects += hikingObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen6 == true && gender == false {
            generatedObjects += hikingObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //PARTY
        
        if chosen7 == true && gender == true {
            generatedObjects += partyObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen7 == true && gender == false {
            generatedObjects += partyObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        //CAMPING
        
        if chosen8 == true && gender == true {
            generatedObjects += campingObjectsMan
            print("sunBeach print MAN")
            
        }
        else if chosen8 == true && gender == false {
            generatedObjects += campingObjectsWoman
            print("SunBeach print WOMAN")
        }
        
        // Do any additional setup after loading the view.
    }
   
    
    var generatedObjects = [String]()
   
    func business (){
    }
    
    func training (){
    }
    
    func sunBeach (){
    }
    
    func skiing () {
    }
    
    func city () {
    }
    
    func hiking () {
    }
    
    
   
    
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
