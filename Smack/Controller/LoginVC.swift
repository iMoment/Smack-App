//
//  LoginVC.swift
//  Smack
//
//  Created by Stanley Pan on 13/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        activityIndicator.isHidden = true
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [.foregroundColor: smackPurplePlaceholder])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [.foregroundColor: smackPurplePlaceholder])
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let email = usernameTextField.text, usernameTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        
        AuthService.instance.logInUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.retrieveUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
                        self.activityIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}










