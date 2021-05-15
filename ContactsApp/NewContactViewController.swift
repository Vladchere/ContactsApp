//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Vladislav Cheremisov on 16.05.2021.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var doneBarButtonItem: UIBarButtonItem!
    

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
