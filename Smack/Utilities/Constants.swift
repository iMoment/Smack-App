//
//  Constants.swift
//  Smack
//
//  Created by Stanley Pan on 12/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//  MARK: URL Constants
let BASE_URL = "https://smackitysmack.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//  MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//  MARK: UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//  MARK: Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
