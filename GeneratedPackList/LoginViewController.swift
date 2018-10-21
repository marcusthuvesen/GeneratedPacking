//
//  LoginViewController.swift
//  GeneratedPackList
//
//  Created by Marcus thuvesen on 2018-10-21.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
   // @IBOutlet weak var emailLabel: UILabel!
   // @IBOutlet weak var passwordLabel: UILabel!
    
    
    @IBAction func emailTouch(_ sender: Any) {
        print("touch")
        emailTextfield.backgroundColor = .white
    }
    @IBAction func passwordTouch(_ sender: UITextField) {
        print("touch")
        passwordTextfield.backgroundColor = .white
        //passwordLabel.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 10
        
        
    }
  

}
