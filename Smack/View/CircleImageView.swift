//
//  CircleImageView.swift
//  Smack
//
//  Created by Stanley Pan on 16/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
