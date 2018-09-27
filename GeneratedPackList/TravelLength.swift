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
    
    @IBOutlet weak var packTitleInput: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    override func viewDidAppear(_ animated: Bool) {
        packTitleInput.text = ""
    }
    
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
    }
   
    
   /* let defaults = UserDefaults.standard
    defaults.set(nyvar, forKey: "listNameString")
    
    UserDefaults.standard.set("TEST", forKey: "packTitleInput") //setObject*/
    
    
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
    
    
    @IBAction func nextViewBtn(_ sender: UIButton) {
        
         var listNameString : String = (packTitleInput.text!)
        UserDefaults.standard.set(listNameString, forKey: "listNameString")
        print(listNameString)
        UserDefaults.standard.set(sliderValue, forKey: "sliderValue")
        print(sliderValue)
    }
    
}
    
    

