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
    
    // Сохранение, получение и удаление из массива по индексу
    /*
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: contactKey) as? [String] {
            return contacts
        }
        return []
    }
    
    func saveContact(with contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: contactKey)
    }
    
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: contactKey)
    }
    */
    
    // Работа с любыми типами данных. Все что можно положить в Data
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: contactKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func saveContact(with contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
}
