//
//  MyData.swift
//  UserDefaultsToFile
//
//  Created by Ideas2IT on 10/08/23.
//

import Foundation

import UIKit

class MyData:  Codable {
    var name: String
    var age: Int
    var dob: Date
    var isLoggedIn: Bool
    var isActDeleted: Bool
    var phoneNumber: String
    
    init(name: String, age: Int, dob: Date, isLoggedIn: Bool, isActDeleted: Bool, phoneNumber: String) {
        self.name = name
        self.age = age
        self.dob = dob
        self.isLoggedIn = isLoggedIn
        self.isActDeleted = isActDeleted
        self.phoneNumber = phoneNumber
    }
}
