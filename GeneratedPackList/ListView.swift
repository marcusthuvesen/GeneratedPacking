//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosen1 == true {
            print("Business print true")
            generatedObjects += businessObjects
            
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
    var businessObjects = ["BUSINESSSTUFF", "Suit", "Tie", "Briefcase"]
    var trainingObjects = ["Joggers", "Running Shoes"]
    var sunBeachObjects = ["SUNBEACHSTUFF","Swimsuit", "Taning oil", "Water", "Beach shoes"]
    var skiingObjects = ["Ski boots"]
    var cityObjects = ["Map"]
    var hikingObjects = ["Walking Stick"]
    var partyObjects = [""]
    var campingObjects = [""]
    
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
            self.businessObjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
   
    
    
   
    
    
    
    var chosen1 = false
    var chosen2 = false
    
   
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return generatedObjects.count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath)
        
        
         cell.textLabel?.text = generatedObjects[indexPath.row]
       
        
        return cell

    }
    
}
