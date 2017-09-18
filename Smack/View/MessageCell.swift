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
        
        guard var isoDate = message.timeStamp else { return }
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
        isoDate = isoDate.substring(to: end)

        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"

        if let finalDate = chatDate {
            let finalDate = dateFormatter.string(from: finalDate)
            timestampLabel.text = finalDate
        }
    }
}












