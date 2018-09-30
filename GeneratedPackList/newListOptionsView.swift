//
//  newListOptionsView.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-09-27.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class newListOptionsView: UIViewController {

    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.layer.cornerRadius = 10
         popupView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    let value = true
    
   
    @IBAction func exitPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
