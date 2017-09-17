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
    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelSelected(_:)), name: NOTIFICATION_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.retrieveUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
                }
            })
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLabel.text = "Please Log In"
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLabel.text = "#\(channelName)"
        getMessages()
    }
    
    func onLoginGetMessages() {
        MessageService.instance.retrieveChannels { (success) in
            if success {
                //  TODO: Do stuff with channels
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLabel.text = "No existing channels"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?.id else { return }
        MessageService.instance.retrieveMessagesForChannel(channelId: channelId) { (success) in
            if success {
                //  TODO: Something
            }
        }
    }
}













