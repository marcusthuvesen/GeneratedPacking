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
    var genderSelected = true

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
        
        UserDefaults.standard.set(genderSelected, forKey: "genderSelected")
        print(genderSelected)
    }
    
    
    @IBAction func womanBtn(_ sender: UIButton) {
        genderSelected = false
        UserDefaults.standard.set(genderSelected, forKey: "genderSelected")
        print(genderSelected)
    }
    
   
   
    

}

