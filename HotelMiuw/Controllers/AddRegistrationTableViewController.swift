//
//  AddRegistrationTableViewController.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 17.01.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    //MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Functions
    //MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        
    }
}
