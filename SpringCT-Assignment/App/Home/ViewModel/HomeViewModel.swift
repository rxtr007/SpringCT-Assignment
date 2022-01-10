//
//  HomeViewModel.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import Foundation

struct HomeViewModel {
    var user: User
    
    init(_ _user: User) {
        self.user = _user
        self.saveUser()
    }
    
    mutating func updateUser(_ _user: User) {
        self.user = _user
        self.saveUser()
    }
    
    private func saveUser() {
        let defaults = UserDefaults.standard
        defaults.set(user.name, forKey: "name")
        defaults.set(user.email, forKey: "email")
        defaults.set(user.phone, forKey: "phone")
    }
}
