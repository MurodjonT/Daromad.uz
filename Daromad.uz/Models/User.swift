//
//  User.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 02/06/25.
//


import SwiftUI

struct User: Identifiable {
    
    // MARK: - Properties
    var id: String?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var imageUrl: String?
    
    
    var fullName: String {
        if let firstName {
            if let lastName {
                return "\(firstName) \(lastName)"
            } else {
                return firstName
            }
        } else if let lastName {
            return lastName
        } else {
            return "Unknown User"
        }
    }
    
    static var mock = User (
        id: "1",
        firstName: "Murodjon",
        lastName: "Turobov",
        phoneNumber: "93-555-33-22",
        imageUrl: "https://avatars.githubusercontent.com/u/116726570?v=4"
    )
}


