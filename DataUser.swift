//
//  DataUser.swift
//  TestApp2.0
//
//  Created by Руслан Плешкунов on 24.10.2024.
//

import Foundation
import SwiftData

@Model
class DataUser {
    var firstName: String
    var secondName: String
    var middleName: String
    var username: String
    var password: String
    var dateCreated: Date
    
    init(firstName: String, secondName: String, middleName: String, username: String, password: String, dateCreated: Date) {
        self.firstName = firstName
        self.secondName = secondName
        self.middleName = middleName
        self.username = username
        self.password = password
        self.dateCreated = dateCreated
    }
}
