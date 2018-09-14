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
        return businessObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IDENTIFIER", for: indexPath)
        
        cell.textLabel?.text = businessObjects[indexPath.row]
        cell.textLabel?.text = sunBeachObjects[indexPath.row]
        cell.textLabel?.text = skiingObjects[indexPath.row]
        cell.textLabel?.text = cityObjects[indexPath.row]
        cell.textLabel?.text = hikingObjects[indexPath.row]
        cell.textLabel?.text = businessObjects[indexPath.row]

        return cell
        
       
    }
    
}
