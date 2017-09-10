//
//  ChatVC.swift
//  Smack
//
//  Created by Stanley Pan on 11/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //  MARK: Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}
