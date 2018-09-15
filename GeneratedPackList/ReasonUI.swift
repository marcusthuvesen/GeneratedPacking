//
//  ReasonUI.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ReasonUI: UIViewController {
    
   
    var businessChosen = false   //Variable for color change
    var sunBeachChosen = false   //Variable for color change
    var cityChosen = false   //Variable for color change
    var hikingChosen = false   //Variable for color change
    var skiingyChosen = false   //Variable for color change
    var trainingChosen = false   //Variable for color change
    var partyChosen = false   //Variable for color change
    var campingChosen = false   //Variable for color change
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var businessOutl: UIButton!
    @IBAction func businessBtn(_ sender: UIButton) {
       
        
        if businessChosen == false {
            businessChosen = true
            print(businessChosen)
            businessOutl.backgroundColor = UIColor.lightGray
            
            let myVar = storyboard?.instantiateViewController(withIdentifier: "ListView") as! ListView
            myVar.chosen1 = businessChosen
            navigationController?.pushViewController(myVar, animated: true)
           
        }
        else if businessChosen == true {
            businessChosen = false
            print(businessChosen)
            businessOutl.backgroundColor = UIColor.black
        }
        
        
        
    }
    
    @IBOutlet weak var sunBeachOutl: UIButton!
    @IBAction func sunBeachBtn(_ sender: UIButton) {
       
        if sunBeachChosen == false {
            sunBeachChosen = true
            print(sunBeachChosen)
            sunBeachOutl.backgroundColor = UIColor.lightGray
            let myVar2 = storyboard?.instantiateViewController(withIdentifier: "ListView") as! ListView
            myVar2.chosen2 = sunBeachChosen
            navigationController?.pushViewController(myVar2, animated: true)
            
            
            
        }
        else if sunBeachChosen == true {
            sunBeachChosen = false
            print(sunBeachChosen)
            sunBeachOutl.backgroundColor = UIColor.black
        }
    }
    
    

}
