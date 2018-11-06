//
//  ViewController.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-09.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Default value true, man
    var genderSelected = 0
    var clickedBtnManValue = false
    var clickedBtnWomanValue = false
    
    @IBOutlet weak var manOutl: UIButton!
    @IBOutlet weak var womanOutl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //View 1, choose gender
    
    @IBAction func manBtn(_ sender: UIButton) {
        
        if clickedBtnManValue == false {
            if clickedBtnWomanValue == true{
                clickedBtnWomanValue = false
                womanOutl.alpha = 1
            }
            clickedBtnManValue = true
            manOutl.alpha = 0.5
            genderSelected = 1
            UserDefaults.standard.setValue(genderSelected, forKey: "genderSelected")
            print("MAN")
        }
        else if clickedBtnManValue == true{
            manOutl.alpha = 1
            womanOutl.alpha = 0.5
            clickedBtnManValue = false
            clickedBtnWomanValue = true
        }
        
    }
    
    
    @IBAction func womanBtn(_ sender: UIButton) {
        
        if clickedBtnWomanValue == false {
            //om man är iklickad
            if clickedBtnManValue == true{
                clickedBtnManValue = false
                manOutl.alpha = 1
            }
            clickedBtnWomanValue  = true
            womanOutl.alpha = 0.5
            genderSelected = 2 //Kvinna
            UserDefaults.standard.setValue(genderSelected, forKey: "genderSelected")
            print("KVINNA")
        }
        else if clickedBtnWomanValue == true{
            womanOutl.alpha = 1
            manOutl.alpha = 0.5
            clickedBtnWomanValue = false
            clickedBtnManValue = true
        }
    }
    
    
    
    
   
   
    

}

