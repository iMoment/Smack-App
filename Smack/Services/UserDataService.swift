//
//  UserDataService.swift
//  Smack
//
//  Created by Stanley Pan on 14/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var email = ""
    private(set) public var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnBackgroundColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ]")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var red, green, blue, alpha: NSString?
        scanner.scanUpToCharacters(from: comma, into: &red)
        scanner.scanUpToCharacters(from: comma, into: &green)
        scanner.scanUpToCharacters(from: comma, into: &blue)
        scanner.scanUpToCharacters(from: comma, into: &alpha)
        
        let defaultColor = UIColor.lightGray
        
        guard let unwrappedRed = red else { return defaultColor }
        guard let unwrappedGreen = green else { return defaultColor }
        guard let unwrappedBlue = blue else { return defaultColor }
        guard let unwrappedAlpha = alpha else { return defaultColor }
        
        let redFloat = CGFloat(unwrappedRed.doubleValue)
        let greenFloat = CGFloat(unwrappedGreen.doubleValue)
        let blueFloat = CGFloat(unwrappedBlue.doubleValue)
        let alphaFloat = CGFloat(unwrappedAlpha.doubleValue)
        
        let newUIColor = UIColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: alphaFloat)
        
        return newUIColor
    }
    
    func logoutUser() {
        id = ""
        avatarColor = ""
        avatarName = ""
        name = ""
        email = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
}












