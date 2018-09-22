//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
   
    var businessObjectsMan = ["BUSINESSSTUFF", "Work Suit", "Tie", "Briefcase", "Work Belt", "Work Socks", "Work Belt", "Business Cards", "Work Cell Phone", "Work Cell Phone Charger", "Laptop", "Laptop Charger", ]
    var trainingObjects = ["TRAININGSTUFF", "Joggers", "Running Shoes"]
    var sunBeachObjects = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Sun Screen", "Water", "Beach shoes", "Showe Slippers"]
    var skiingObjects = ["SKISTUFF", "Ski boots"]
    var cityObjects = ["CITYSTUFF", "Map"]
    var hikingObjects = ["HIKINGSTUFF", "Walking Stick"]
    var partyObjects = [""]
    var campingObjects = [""]
    
 
    
    var chosen1 = false
    var chosen2 = false
    
    
    @IBOutlet weak var listLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let listNamn = defaults.string(forKey: "TEST")
     //   print(listLabel)
       
        
        let name = UserDefaults.standard.string(forKey: "listNameString")
        print("Det funkar" + (name!))
        listLabel.text = "hej"
        
        if chosen1 == true{
            print("Business print true")
            generatedObjects += businessObjectsMan
            
        }
        else if chosen1 == false {
            print("Business print false")
        }
        
        if chosen2 == true{
            print("sunBeach print true")
            generatedObjects += sunBeachObjects
            
        }
        else if chosen2 == false {
            print("SunBeach print False")
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
