//
//  User.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/9/21.
//

import Foundation

struct User {
    
    // Struct/Class attributes
    var username: String
    var password: String
    
    // Constructor
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
