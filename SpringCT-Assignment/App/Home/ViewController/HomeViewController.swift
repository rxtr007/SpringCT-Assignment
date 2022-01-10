//
//  HomeViewController.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    static let identifier: String = "HomeViewController"
    
    @IBOutlet weak private var userNameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var phoneTextField: UITextField!
    @IBOutlet weak private var editButton: UIButton!
    @IBOutlet weak private var saveButton: UIButton!
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserUI()
    }
    
    private func setupUserUI() {
        self.title = "User Information"
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        enableUserInteractionForTextFields(false)
        
        guard let viewModel = viewModel else {
            
            /**
             defaults.set(user.name, forKey: "name")
             defaults.set(user.email, forKey: "email")
             defaults.set(user.phone, forKey: "phone")
             */
            
            let name = UserDefaults.standard.value(forKey: "name") as? String
            let email = UserDefaults.standard.value(forKey: "email") as? String
            let phone = UserDefaults.standard.value(forKey: "phone") as? String
            
            displayInfo(from: HomeViewModel(User(name: name ?? "", email: email ?? "", phone: phone ?? "")))
            
            return
        }
        
        displayInfo(from: viewModel)
    }
    
    private func displayInfo(from viewModel: HomeViewModel) {
        self.userNameTextField.text = viewModel.user.name
        self.emailTextField.text = viewModel.user.email
        self.phoneTextField.text = viewModel.user.phone
    }
    
    private func enableUserInteractionForTextFields(_ enable: Bool) {
        let textFields = [userNameTextField, emailTextField, phoneTextField]
        
        textFields.forEach { textField in
            textField?.isEnabled = enable
        }
    }
    
    @IBAction private func editButtonAction(_ sender: UIButton!) {
        enableUserInteractionForTextFields(true)
    }
    
    @IBAction private func saveButtonAction(_ sender: UIButton!) {
        if let name = userNameTextField.text {
            if let email = emailTextField.text {
                if let phone = phoneTextField.text {
                    
                    guard var viewModel = viewModel else { return }
                    viewModel.updateUser(User(name: name, email: email, phone: phone))
                    
                    enableUserInteractionForTextFields(false)
                    displayInfo(from: viewModel)
                }else {
                    self.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.PhoneValidationError)
                }
            }else {
                self.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.EmailValidationError)
            }
        }else {
            self.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.NameValidationError)
        }
    }
}
