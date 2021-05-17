//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Vladislav Cheremisov on 16.05.2021.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact)
}

class NewContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var doneBarButtonItem: UIBarButtonItem!
    
    var delegate: NewContactViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBarButtonItem.isEnabled = false

        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    
    @objc private func firstNameTextFieldDidChanged() {
        guard let firstName = firstNameTextField.text else { return }
        doneBarButtonItem.isEnabled = !firstName.isEmpty ? true : false
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndExit()
    }
    
    private func saveAndExit() {
        let contact = Contact(name: firstNameTextField.text ?? "Noname",
                              surname: lastNameTextField.text ?? "")
        
        StorageManager.shared.saveContact(with: contact.fullName)
        
        delegate?.saveContact(contact)
        
        dismiss(animated: true)
    }
}
