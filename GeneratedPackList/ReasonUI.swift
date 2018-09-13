//
//  ReasonUI.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ReasonUI: UIViewController {
    
    var reasonForTravel = true
    var sliderValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //SETS REASONFORTRAVEL VARIABLE
    
   
    
    //Slider value
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        print(sliderValue)
        sliderLabel.text = "Travelling for " + String(sliderValue) + " days"
        
    }
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    
    @IBAction func laundryAccess(_ sender: UIButton) {
        if(sliderValue > 6){
        sliderValue = 7
            print("landry ändrad till " + String(sliderValue))
        }
    }
    
    

}
