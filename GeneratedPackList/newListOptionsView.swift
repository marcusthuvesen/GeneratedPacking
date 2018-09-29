//
//  newListOptionsView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-27.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class newListOptionsView: UIViewController {

var newEmptyListValue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(newEmptyListValue, forKey: "newEmptyListValue")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func newGeneratedListBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
    
    @IBAction func newEmptyList(_ sender: UIButton) {
       newEmptyListValue = true
       UserDefaults.standard.set(newEmptyListValue, forKey: "newEmptyListValue")
        
    }
    
    
}
