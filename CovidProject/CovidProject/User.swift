//
//  User.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/9/21.
//

import Foundation

struct User {
    
    static var currentUser: User?
    
    // Struct/Class attributes
    var username: String
    var password: String
    var state: String
        
    // Constructor
    init(username: String, password: String, state: String) {
        self.username = username
        self.password = password
        self.state = state
        User.currentUser = self
    }
    
    
}

