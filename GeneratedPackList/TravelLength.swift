//
//  TravelLength.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-13.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase
class TravelLength: UIViewController {

    
    var sliderValue = 1
    
  
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var laundryOutl: UIButton!
    @IBOutlet weak var sliderLabel: UILabel!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laundryOutl.layer.cornerRadius = 10
        
        ref = Database.database().reference()
    }
 
    override func viewDidAppear(_ animated: Bool) {
       
    }
   
   
    
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
        
        
        //ref.child("listnameFB").setValue(packTitleInput.text)
        
        
        UserDefaults.standard.set(sliderValue, forKey: "sliderValue")
        print(sliderValue)
    }
    
}
    
    

