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
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    //  MARK: Variables
    var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.dataSource = self
        messageTableView.delegate = self
        messageTableView.estimatedRowHeight = 80
        messageTableView.rowHeight = UITableViewAutomaticDimension
        sendMessageButton.isHidden = true
        
        view.bindToKeyboard()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapToDismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelSelected(_:)), name: NOTIFICATION_CHANNEL_SELECTED, object: nil)
        
        SocketService.instance.getChatMessage { (success) in
            if success {
                self.messageTableView.reloadData()
                if MessageService.instance.messages.count > 0 {
                    let endIndexPath = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
                    self.messageTableView.scrollToRow(at: endIndexPath, at: .bottom, animated: false)
                }
            }
        }
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.retrieveUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
                }
            })
        }
    }
    @IBAction func messageTextFieldEditing(_ sender: Any) {
        if messageTextField.text == "" {
            isTyping = false
            sendMessageButton.isHidden = true
        } else {
            if isTyping == false {
                sendMessageButton.isHidden = false
            }
            isTyping = true
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelId = MessageService.instance.selectedChannel?.id else { return }
            guard let message = messageTextField.text else { return }
            
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId, completion: { (success) in
                
                if success {
                    self.messageTextField.text = ""
                    self.messageTextField.resignFirstResponder()
                }
            })
        }
    }
    
    @objc func handleTapToDismissKeyboard(_ tapGesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLabel.text = "Please Log In"
            messageTableView.reloadData()
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
                self.messageTableView.reloadData()
            }
        }
    }
}

extension ChatVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell {
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ChatVC: UITableViewDelegate {
    
}











