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
    @IBOutlet weak var menuProfileImageView: CircleImageView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            menuProfileImageView.image = UIImage(named: UserDataService.instance.avatarName)
            menuProfileImageView.backgroundColor = UserDataService.instance.returnBackgroundColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            menuProfileImageView.image = UIImage(named: "menuProfileIcon")
            menuProfileImageView.backgroundColor = .clear
        }
    }
}
