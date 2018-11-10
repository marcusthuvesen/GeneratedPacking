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
    
    
    //Variable for color change
    var clickedBtn1 = false
    var clickedBtn2 = false
    var clickedBtn3 = false
    var clickedBtn4 = false
    var clickedBtn5 = false
    var clickedBtn6 = false
    var clickedBtn7 = false
    var clickedBtn8 = false
    let myCustomColor = UIColor(red: 91/255.0, green: 168/255.0, blue: 184/255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chosenActivities(_ sender: UIButton) {
        
        //If user clicks change BGColor
        if sender.tag == 1 && clickedBtn1 == false {
            businessOutl.alpha = 0.5
            clickedBtn1 = true
        }
        else if sender.tag == 1 && clickedBtn1 == true{
            businessOutl.alpha = 1
            clickedBtn1 = false
        }
        
        if sender.tag == 2 && clickedBtn2 == false{
            beachOutl.alpha = 0.5
            clickedBtn2 = true
        }
        else if sender.tag == 2 && clickedBtn2 == true{
            beachOutl.alpha = 1
            clickedBtn2 = false
        }
        
        if sender.tag == 3 && clickedBtn3 == false{
            cityOutl.alpha = 0.5
            clickedBtn3 = true
        }
        else if sender.tag == 3 && clickedBtn3 == true{
            cityOutl.alpha = 1
            clickedBtn3 = false
        }
        
        if sender.tag == 4 && clickedBtn4 == false{
            skiingOutl.alpha = 0.5
            clickedBtn4 = true
        }
        else if sender.tag == 4 && clickedBtn4 == true{
            skiingOutl.alpha = 1
            clickedBtn4 = false
        }
        
        if sender.tag == 5 && clickedBtn5 == false{
            trainingOutl.alpha = 0.5
            clickedBtn5 = true
        }
        else if sender.tag == 5 && clickedBtn5 == true{
            trainingOutl.alpha = 1
            clickedBtn5 = false
        }
        
        if sender.tag == 6 && clickedBtn6 == false{
            partyOutl.alpha = 0.5
            clickedBtn6 = true
        }
        else if sender.tag == 6 && clickedBtn6 == true{
            partyOutl.alpha = 1
            clickedBtn6 = false
        }
    
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //Sending values when user clicks next
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var myVar = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        myVar.chosen1 = clickedBtn1
        myVar.chosen2 = clickedBtn2
        myVar.chosen3 = clickedBtn3
        myVar.chosen4 = clickedBtn4
        myVar.chosen5 = clickedBtn5
        myVar.chosen6 = clickedBtn6
        
        
        self.present(myVar, animated: true)
        
    }
  
}
