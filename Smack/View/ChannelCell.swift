//
//  ChannelCell.swift
//  Smack
//
//  Created by Stanley Pan on 17/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    //  MARK: Outlets
    @IBOutlet weak var channelNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channelNameLabel.text = "#\(title)"
        channelNameLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        for id in MessageService.instance.unreadChannels {
            if id == channel.id {
                channelNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
            }
        }
    }
}



















