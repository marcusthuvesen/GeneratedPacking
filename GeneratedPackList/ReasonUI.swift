//
//  ReasonUI.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-12.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ReasonUI: UIViewController{
   
    @IBOutlet weak var businessOutl: UIButton!
    @IBOutlet weak var beachOutl: UIButton!
    @IBOutlet weak var cityOutl: UIButton!
    @IBOutlet weak var skiingOutl: UIButton!
    @IBOutlet weak var trainingOutl: UIButton!
    @IBOutlet weak var partyOutl: UIButton!
    @IBOutlet weak var hikingOutl: UIButton!
    @IBOutlet weak var campingOutl: UIButton!
    
    
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
    
    
    @IBAction func chosenActivities(_ sender: UIButton) {
        if sender.tag == 1 && {
            businessOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 2 {
            beachOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 3 {
            cityOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 4 {
            skiingOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 5 {
            trainingOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 6 {
            partyOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 7 {
            hikingOutl.backgroundColor = UIColor.gray
        }
        if sender.tag == 8 {
            campingOutl.backgroundColor = UIColor.gray
        }
    }
    
    
    
    
  
   
    
    
 
   /*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //Sending values when user clicks next
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var myVar = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        myVar.chosen1 = businessChosen
        myVar.chosen2 = sunBeachChosen
        myVar.chosen3 = cityChosen
        myVar.chosen4 = hikingChosen
        myVar.chosen5 = skiingChosen
        myVar.chosen6 = trainingChosen
        myVar.chosen7 = partyChosen
        myVar.chosen8 = campingChosen
        
        self.present(myVar, animated: true)
        
    }
  
    */
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
