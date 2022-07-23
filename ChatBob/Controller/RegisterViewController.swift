//
//  RegisterViewController.swift
//  ChatBob
//
//  Created by Abhinay Pratap on 08/07/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
//            let trimmedEmail = email.trimmingCharacters(in: .whitespaces)
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                } else {
                    // Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.segue1, sender: self)
                }
            }
        }
    }
}
