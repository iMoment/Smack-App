//
//  Channel.swift
//  Smack
//
//  Created by Stanley Pan on 17/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    
    private(set) public var channelTitle: String!
    private(set) public var channelDescription: String!
    private(set) public var id: String!
}
