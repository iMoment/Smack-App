//
//  MessageCell.swift
//  Smack
//
//  Created by Stanley Pan on 18/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //  MARK: Outlets
    @IBOutlet weak var userImageView: CircleImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(message: Message) {
        messageLabel.text = message.message
        usernameLabel.text = message.userName
        userImageView.image = UIImage(named: message.userAvatar)
        userImageView.backgroundColor = UserDataService.instance.returnBackgroundColor(components: message.userAvatarColor)
        
    }
}
