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
        ref = Database.database().reference()
        self.hideKeyboardWhenTappedAround()
        loginBtn.layer.cornerRadius = 10
        
        
    }
  
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if emailTextfield.text == "" && passwordTextfield.text == "" {
            print("tomt")
        }
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            // Logga in användaren
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
                if user != nil {
                    // Användaren lyckades logga in
                    print("SUCCESS")
                    self.performSegue(withIdentifier: "segue", sender: self)
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


