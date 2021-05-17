//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Vladislav on 11.05.2021.
//

import UIKit

class ContactListViewController: UIViewController, NewContactViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contactName = UserDefaults.standard.value(forKey: "ContactName") {
            print(contactName)
            let contact = Contact(name: contactName as! String, surname: "")
            contacts.append(contact)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.modalPresentationStyle = .fullScreen
        newContactVC.delegate = self
    }
    
    // MARK: - Public method
    func saveContact(_ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}

// MARK: - UITAbleViewDataSource
extension ContactListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContact", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.fullName
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            UserDefaults.standard.removeObject(forKey: "ContactName")
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
