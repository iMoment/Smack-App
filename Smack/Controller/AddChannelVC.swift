//
//  AddChannelVC.swift
//  Smack
//
//  Created by Stanley Pan on 17/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTextField.text, nameTextField.text != "" else { return }
        guard let channelDescription = descriptionTextField.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView() {
        let closeTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeTapped(_:)))
        backgroundView.addGestureRecognizer(closeTapGesture)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [.foregroundColor: smackPurplePlaceholder])
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func closeTapped(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
