//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Stanley Pan on 13/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //  MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func chooseAvatarPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func generateBackgroundColorPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, emailTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("We registered a user.")
            }
        }
    }
}























