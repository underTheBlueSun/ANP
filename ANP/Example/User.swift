//
//  User.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/29.
//

import Foundation

struct User: Decodable, Hashable {
    
    var node_id: String
    var login: String
    var avatar_url: String
}

struct Results: Decodable {
    var items: [User]
    
}
