//
//  ChannelVC.swift
//  Smack
//
//  Created by Stanley Pan on 11/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    
}
