//
//  SignUpViewController.swift
//  GeneratedPackList
//
//  Created by Marcus thuvesen on 2018-10-22.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    
    var ref : DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        invalidLabel.alpha = 0
        signUpOutlet.layer.cornerRadius = 10
        emailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            
            // Registrera användaren
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: {(user, error) in
                if user != nil {
                    print("SUCCESS")
                    let ref = Database.database().reference()
                    let usersReference = ref.child("Users")
                    
                    let uid = user?.user.uid
                    let newUserReference = usersReference.child(uid!)
                    newUserReference.setValue(["email": self.emailTextfield.text])
                    print("description \(newUserReference.description())")
                    
                    self.performSegue(withIdentifier: "segue2", sender: self)
        
                }
                else {
                    
                    if let myError = error?.localizedDescription
                    {
                        self.invalidLabel.alpha = 1
                    }
                    else {
                        print("ERROR")
                    }
                }
            })
          
        }
    }
    

   

}
