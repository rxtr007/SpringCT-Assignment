//
//  AppDelegate.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let isLoggedIn = UserDefaults.standard.value(forKey: "IsLoggedIn") as? Bool ?? false
        
        if isLoggedIn {
            navigateToHomeScreen()
        }else {
            navigateToLoginScreen()
        }
        
        return true
    }
    
    func navigateToLoginScreen() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: LoginViewController.identifier) as! LoginViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: loginViewController)
        self.window?.makeKeyAndVisible()
    }
    
    func navigateToHomeScreen() {
        let name = UserDefaults.standard.value(forKey: "name") as? String ?? ""
        let email = UserDefaults.standard.value(forKey: "email") as? String ?? ""
        let phone = UserDefaults.standard.value(forKey: "phone") as? String ?? ""
        
        let homeViewModel = HomeViewModel(User(name: name, email: email, phone: phone))
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        homeViewController.viewModel = homeViewModel
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        self.window?.makeKeyAndVisible()
    }
}

