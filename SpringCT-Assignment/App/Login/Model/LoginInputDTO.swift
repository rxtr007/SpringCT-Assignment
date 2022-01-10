//
//  LoginInputDTO.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import Foundation

struct LoginInputDTO {
    let username: String
    let password: String
    
    func isValidEmail() -> Bool {
        return !username.isEmpty
    }
    
    func isValidPassword() -> Bool {
        return !password.isEmpty
    }
}

struct User: Codable {
    var name: String
    var email: String
    var phone: String
}

struct ErrorMessage {
    static let ErrorTitle = "Warning"
    static let APIError = "Something went wrong!"
    static let UsernameValidationError = "Invalid Username"
    static let PasswordValidationError = "Invalid Password"
    
    static let NameValidationError = "Enter User Name"
    static let EmailValidationError = "Enter Email Address"
    static let PhoneValidationError = "Enter Phone Number"
}
