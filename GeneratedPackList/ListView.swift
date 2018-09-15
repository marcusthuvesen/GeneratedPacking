//
//  ListView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var businessObjects = ["Suit", "Tie", "Briefcase"]
    var trainingObjects = ["Joggers"]
    var sunBeachObjects = ["Swimsuit"]
    var skiingObjects = ["Ski boots"]
    var cityObjects = ["Map"]
    var hikingObjects = ["Walking Stick"]
    var partyObjects = [""]
    var campingObjects = [""]

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return sunBeachObjects.count + businessObjects.count
    }
    
    
    var chosen1 = false
    var chosen2 = false
    var chosen3 = false
    var chosen4 = false
    var chosen5 = false
    var chosen6 = false
    var chosen7 = false
    var chosen8 = false
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath)
        
        
        if chosen1 == true{
        print("Business print")
        cell.textLabel?.text = businessObjects[indexPath.row]
        }
        if chosen2 == true{
         print("sunBeach print")
         cell.textLabel?.text = sunBeachObjects[indexPath.row]
        }
        if chosen3 == true {
             print("Skiing print")
        cell.textLabel?.text = skiingObjects[indexPath.row]
        }
        if chosen4 == true {
             print("City print")
        cell.textLabel?.text = cityObjects[indexPath.row]
        }
        
        if chosen5 == true{
        print("Hiking print")
        cell.textLabel?.text = hikingObjects[indexPath.row]
        }
        if chosen6 == true {
             print("Party print")
        cell.textLabel?.text = partyObjects[indexPath.row]
        }
       
        if chosen7 == true {
             print("training print")
            cell.textLabel?.text = trainingObjects[indexPath.row]
        }
        
        if chosen8 == true {
             print("Business print")
            cell.textLabel?.text = campingObjects[indexPath.row]
        }
        
        return cell

    }
    
}
