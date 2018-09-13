//
//  TravelLength.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class TravelLength: UIViewController {
var sliderValue = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBOutlet weak var packTitleInput: UITextField!
    
    
    @IBAction func textFieldBtn(_ sender: UIButton) {
        var packTitle : String = packTitleInput.text!
        print(packTitle)
        packTitleInput.resignFirstResponder()
    }
    
    
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        print(sliderValue)
        sliderLabel.text = "Travelling for " + String(sliderValue) + " days"
    }
    
    @IBAction func laundryAccess(_ sender: UIButton) {
        if(sliderValue > 6){
            sliderValue = 7
            print("landry ändrad till " + String(sliderValue))
        }
    }
}
    
    

