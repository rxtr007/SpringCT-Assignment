//
//  LoginViewController.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import UIKit


class LoginViewController: UIViewController {
    
    static let identifier: String = "LoginViewController"
    
    @IBOutlet weak private var userNameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var logoImage: UIImageView!
    @IBOutlet weak private var loginButton: UIButton!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        [logoImage, loginButton].forEach { element in
            element?.layer.cornerRadius = 15
        }
        
    }
    
    @IBAction private func loginButtonAction(_ sender: UIButton!) {
        if let username = userNameTextField.text, let password = passwordTextField.text {
            let inputModel = LoginInputDTO(username: username, password: password)
            
            if inputModel.isValidEmail() {
                if inputModel.isValidPassword() {
                    viewModel.login(with: inputModel) { [weak self] user, isSuccess in
                        if isSuccess {
                            // navigate to home screen
                            guard let user = user else {
                                DispatchQueue.main.async {
                                    self?.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.UsernameValidationError)
                                }
                                return
                            }
                            UserDefaults.standard.set(true, forKey: "IsLoggedIn")
                            DispatchQueue.main.async {
                                let homeViewModel = HomeViewModel(user)
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
                                homeViewController.viewModel = homeViewModel
                                self?.navigationController?.pushViewController(homeViewController, animated: true)
                            }
                            
                            
                        }else {
                            // show error
                            DispatchQueue.main.async {
                                self?.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.UsernameValidationError)
                            }
                        }
                    }
                }else {
                    // Show Invalid password error
                    DispatchQueue.main.async {
                        self.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.PasswordValidationError)
                    }
                }
            }else {
                // Show Invalid email error
                DispatchQueue.main.async {
                    self.showAlert(title: ErrorMessage.ErrorTitle, message: ErrorMessage.UsernameValidationError)
                }
            }
        }
    }
}
