//
//  ReasonUI.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ReasonUI: UIViewController {
    
   var businessActivity = false
    var businessChosen = false   //Variable for color change
    
   var sunBeachActivity = false
    var sunBeachChosen = false   //Variable for color change
    
   var cityActivity = false
    var cityChosen = false   //Variable for color change
    
   var hikingActivity = false
    var hikingChosen = false   //Variable for color change
    
   var skiingActivity = false
    var skiingyChosen = false   //Variable for color change
    
   var trainingActivity = false
    var trainingChosen = false   //Variable for color change
    
   var partyActivity = false
    var partyChosen = false   //Variable for color change
    
   var campingActivity = false
    var campingChosen = false   //Variable for color change
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var businessOutl: UIButton!
    @IBAction func businessBtn(_ sender: UIButton) {
       
        if businessChosen == false {
            businessActivity = true
            print(businessActivity)
            businessOutl.backgroundColor = UIColor.lightGray
            businessChosen = true
        }
        else if businessChosen == true {
            businessActivity = false
            print(businessActivity)
            businessOutl.backgroundColor = UIColor.black
            businessChosen = false
        }
        
    }
    
    @IBOutlet weak var sunBeachOutl: UIButton!
    @IBAction func sunBeachBtn(_ sender: UIButton) {
       
        if sunBeachChosen == false {
            sunBeachActivity = true
            print(sunBeachActivity)
            sunBeachOutl.backgroundColor = UIColor.lightGray
            sunBeachChosen = true
        }
        else if sunBeachChosen == true {
            sunBeachActivity = false
            print(sunBeachActivity)
            sunBeachOutl.backgroundColor = UIColor.black
            sunBeachChosen = false
        }
    }
    
    
    

}
