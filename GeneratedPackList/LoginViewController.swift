//
//  LoginViewController.swift
//  GeneratedPackList
//
//  Created by Marcus thuvesen on 2018-10-21.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var failedMessage: UILabel!
    
    
    @IBAction func emailedTouched(_ sender: UITextField) {
        UITextField.animate(withDuration: 0.2) {
            self.emailLabel.isHidden = true
            self.emailTextfield.backgroundColor = .white
            self.emailTextfield.placeholder = "Email"
        }
    }
    
    @IBAction func passwordTouched(_ sender: UITextField) {
        UITextField.animate(withDuration: 0.2) {
            self.passwordLabel.isHidden = true
            self.passwordTextfield.backgroundColor = .white
            self.passwordTextfield.placeholder = "Password"
        }
    }
    
    var ref : DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        failedMessage.alpha = 0
        ref = Database.database().reference()
        self.hideKeyboardWhenTappedAround()
        loginBtn.layer.cornerRadius = 10
        emailTextfield.layer.cornerRadius = 5
        passwordTextfield.layer.cornerRadius = 5
        
    }
  
    func saveLoggedState() {
        
        let def = UserDefaults.standard
        def.set(true, forKey: "is_authenticated") // save true flag to UserDefaults
        def.synchronize()
        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
       
        if emailTextfield.text == "" && passwordTextfield.text == "" {
             self.failedMessage.alpha = 1
        }
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            
            // Logga in användaren
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
                if user != nil {
                    // Användaren lyckades logga in
                    print("SUCCESS")
                    self.saveLoggedState()
                    self.performSegue(withIdentifier: "segueToStart", sender: self)
                }
                else // ERROR
                {
                    
                    if let myError = error?.localizedDescription
                    {
                        self.failedMessage.alpha = 1
                        print(myError)
                        
                    }
                    else {
                        print("ERROR")
                    }
                }
            })
        }
      
    }
  
    @IBAction func signUpBtn(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: self)
    }
    
    
    
    
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


