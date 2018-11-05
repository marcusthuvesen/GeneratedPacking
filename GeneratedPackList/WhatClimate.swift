//
//  WhatClimate.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class WhatClimate: UIViewController {
    @IBOutlet weak var hotOutl: UIButton!
    @IBOutlet weak var mildOutl: UIButton!
    @IBOutlet weak var coldOutl: UIButton!
    @IBOutlet weak var rainyOutl: UIButton!
    
    var clickedBtn1 = false
    var clickedBtn2 = false
    var clickedBtn3 = false
    var clickedBtn4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chosenWeather(_ sender: UIButton) {
        //Change color if user clicks
        
        if sender.tag == 1 && clickedBtn1 == false {
            hotOutl.alpha = 0.5
            clickedBtn1 = true
        }
        else if sender.tag == 1 && clickedBtn1 == true{
            hotOutl.alpha = 1
            clickedBtn1 = false
        }
        if sender.tag == 2 && clickedBtn2 == false{
            mildOutl.alpha = 0.5
            clickedBtn2 = true
        }
        else if sender.tag == 2 && clickedBtn2 == true{
            mildOutl.alpha = 1
            clickedBtn2 = false
        }
        if sender.tag == 3 && clickedBtn3 == false{
            coldOutl.alpha = 0.5
            clickedBtn3 = true
        }
        else if sender.tag == 3 && clickedBtn3 == true{
            coldOutl.alpha = 1
            clickedBtn3 = false
        }
        if sender.tag == 4 && clickedBtn4 == false{
            rainyOutl.alpha = 0.5
            clickedBtn4 = true
        }
        else if sender.tag == 4 && clickedBtn4 == true{
            rainyOutl.alpha = 1
            clickedBtn4 = false
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //Sending values when user clicks next
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var myVar = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        myVar.weatherHot = clickedBtn1
        myVar.weatherMild = clickedBtn2
        myVar.weatherCold = clickedBtn3
        myVar.weatherRainy = clickedBtn4
        
        
        self.present(myVar, animated: true)
        
    }*/
    

}
