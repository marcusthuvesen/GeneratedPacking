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
    var skiingChosen = false   //Variable for color change
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
    
    
    @IBOutlet weak var cityOutl: UIButton!
    @IBAction func cityBtn(_ sender: UIButton) {
        if cityChosen == false {
            cityChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            cityOutl.backgroundColor = UIColor.lightGray
            
        }
        else if cityChosen == true {
            cityChosen = false
            print("Nu skickar vi inget2")
            cityOutl.backgroundColor = UIColor.black
        }
    }
    
    @IBOutlet weak var hikingOutl: UIButton!
    @IBAction func hikingBtn(_ sender: UIButton) {
        if hikingChosen == false {
            hikingChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            hikingOutl.backgroundColor = UIColor.lightGray
            
        }
        else if hikingChosen == true {
            hikingChosen = false
            print("Nu skickar vi inget2")
            hikingOutl.backgroundColor = UIColor.black
        }
    }
    
    @IBOutlet weak var skiingOutl: UIButton!
    @IBAction func skiingBtn(_ sender: UIButton) {
        if skiingChosen == false {
            skiingChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            skiingOutl.backgroundColor = UIColor.lightGray
            
        }
        else if skiingChosen == true {
            skiingChosen = false
            print("Nu skickar vi inget2")
            skiingOutl.backgroundColor = UIColor.black
        }
    }
    
    @IBOutlet weak var trainingOutl: UIButton!
    @IBAction func trainingBtn(_ sender: UIButton) {
        if trainingChosen == false {
            trainingChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            trainingOutl.backgroundColor = UIColor.lightGray
            
        }
        else if trainingChosen == true {
            trainingChosen = false
            print("Nu skickar vi inget2")
            trainingOutl.backgroundColor = UIColor.black
        }
    }
    
    @IBOutlet weak var partyOutl: UIButton!
    @IBAction func partyBtn(_ sender: UIButton) {
        if partyChosen == false {
            partyChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            partyOutl.backgroundColor = UIColor.lightGray
            
        }
        else if partyChosen == true {
            partyChosen = false
            print("Nu skickar vi inget2")
            partyOutl.backgroundColor = UIColor.black
        }
    }
    
    @IBOutlet weak var campingOutl: UIButton!
    @IBAction func campingBtn(_ sender: UIButton) {
        if campingChosen == false {
            campingChosen = true
            print("Nu försöker vi skicka true2 till ListView")
            campingOutl.backgroundColor = UIColor.lightGray
            
        }
        else if campingChosen == true {
            campingChosen = false
            print("Nu skickar vi inget2")
            campingOutl.backgroundColor = UIColor.black
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //Sending values when user clicks next
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var myVar = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        myVar.chosen1 = businessChosen
        myVar.chosen2 = sunBeachChosen
        myVar.chosen3 = cityChosen
        self.present(myVar, animated: true)
        
    }
  
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
