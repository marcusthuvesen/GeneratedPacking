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
    @IBOutlet weak var abroadOutl: UIButton!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    var wasClicked = false
    var valueSave : Int = 1
    var travelWasClicked = false
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laundryOutl.layer.cornerRadius = 10
        laundryOutl.clipsToBounds = true
        abroadOutl.layer.cornerRadius = 10
        abroadOutl.clipsToBounds = true
        progressBar.frame.size.width = ((view.frame.size.width)/4 - 16)
        ref = Database.database().reference()
        
        UserDefaults.standard.setValue(0, forKey: "genderSelected")
        UserDefaults.standard.setValue(false, forKey: "travelValue")
    }
 
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        print(sliderValue)
        valueSave = sliderValue
        sliderLabel.text = "Travelling for " + String(sliderValue) + " days"
    }
    
    @IBAction func laundryAccess(_ sender: UIButton) {
        
        if wasClicked == false{
            laundryOutl.alpha = 0.5
            wasClicked = true
            print(sliderValue)
        }
        else if wasClicked == true{
            laundryOutl.alpha = 1
            wasClicked = false
            sliderValue = valueSave
            print(sliderValue)
        }
 
        if sliderValue >= 14 && wasClicked == true{
            sliderValue = 7
            print("landry ändrad till " + String(sliderValue))
           
        }
        else if sliderValue > 2 && sliderValue <= 13 && wasClicked == true{
            sliderValue = Int(sliderValue/2)
            print(sliderValue)
        }
    }
    @IBAction func abroadBtn(_ sender: UIButton) {
        if travelWasClicked == false{
            abroadOutl.alpha = 0.5
            travelWasClicked = true
        }
        else if travelWasClicked == true{
            abroadOutl.alpha = 1
            travelWasClicked = false
        }
    }
    
    @IBAction func nextViewBtn(_ sender: UIButton) {
        
        UserDefaults.standard.set(travelWasClicked, forKey: "travelValue")
        
        UserDefaults.standard.set(sliderValue, forKey: "sliderValue")
        print(sliderValue)
    }
    
}
    
    

