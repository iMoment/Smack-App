//
//  ProfileVC.swift
//  Smack
//
//  Created by Stanley Pan on 16/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        usernameLabel.text = UserDataService.instance.name
        userEmailLabel.text = UserDataService.instance.email
        profileImageView.image = UIImage(named: UserDataService.instance.avatarName)
        profileImageView.backgroundColor = UserDataService.instance.returnBackgroundColor(components: UserDataService.instance.avatarColor)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        self.backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func closeTap(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
