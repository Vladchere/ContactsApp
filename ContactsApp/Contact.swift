//
//  Contact.swift
//  ContactsApp
//
//  Created by Vladislav Cheremisov on 15.05.2021.
//

struct Contact: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
