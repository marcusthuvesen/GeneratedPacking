//
//  ReasonUI.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ReasonUI: UIViewController {
    
   
    var businessChosen = false//Variable for color change
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
            print("Nu försöker vi skicka true till Listview")
            businessOutl.backgroundColor = UIColor.lightGray
            
            
        }
        else if businessChosen == true {
            businessChosen = false
            print("Nu skickar vi inget")
            businessOutl.backgroundColor = UIColor.black
        }
        
    }
   
   
    
    @IBOutlet weak var sunBeachOutl: UIButton!
    @IBAction func sunBeachBtn(_ sender: UIButton) {
       
        if sunBeachChosen == false {
            sunBeachChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            sunBeachOutl.backgroundColor = UIColor.lightGray
            
        }
        else if sunBeachChosen == true {
            sunBeachChosen = false
            print("Nu skickar vi inget2")
            sunBeachOutl.backgroundColor = UIColor.black
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //Sending values when user clicks next
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var myVar = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        myVar.chosen1 = businessChosen
        myVar.chosen2 = sunBeachChosen
        self.present(myVar, animated: true)
        
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
