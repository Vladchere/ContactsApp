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
    
    // MARK: - Outlets
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var doneBarButtonItem: UIBarButtonItem!
    
    // MARK: - Public properties
    var delegate: NewContactViewControllerDelegate?

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBarButtonItem.isEnabled = false

        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndExit()
    }
    
    // MARK: - Private methods
    @objc private func firstNameTextFieldDidChanged() {
        guard let firstName = firstNameTextField.text else { return }
        doneBarButtonItem.isEnabled = !firstName.isEmpty ? true : false
    }
    
    private func saveAndExit() {
        guard let name = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let contact = Contact(name: name, lastName: lastName)
            
        StorageManager.shared.saveContactToFile(with: contact)
        delegate?.saveContact(contact)
        
        dismiss(animated: true)
    }
}
