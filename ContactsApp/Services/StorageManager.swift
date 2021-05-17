//
//  StorageManager.swift
//  ContactsApp
//
//  Created by Vladislav Cheremisov on 17.05.2021.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let contactKey = "contacts"
    
    private init() {}
    
    func saveContact(with contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: contactKey)
    }
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: contactKey) as? [String] {
            return contacts
        }
        return []
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: contactKey)
    }
}
