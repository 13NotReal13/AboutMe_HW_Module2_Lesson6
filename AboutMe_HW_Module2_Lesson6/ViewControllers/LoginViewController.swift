//
//  LoginViewController.swift
//  AboutMe_HW_Module2_Lesson6
//
//  Created by Иван Семикин on 10/02/2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = user.login
        passwordTextField.text = user.password
        print("User ID: \(user.id)")
    }
    
    // MARK: Override funcs
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMesage: "Please, enter correct login and password"
            )
            return false
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBar = segue.destination as? UITabBarController
        
        tabBar?.viewControllers?.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationController = viewController as? UINavigationController {
                let userDataVC = navigationController.topViewController as? UserDataViewController
                userDataVC?.user = user
            }
        }
    }
    
    // MARK: IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "OOPS!", andMesage: "Your username: \(user.login)")
        : showAlert(withTitle: "OOPS!", andMesage: "Your password: \(user.password)")
    }
}

// MARK: Extension
extension LoginViewController {
    private func showAlert(withTitle title: String, andMesage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okButtonAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(okButtonAction)
        present(alert, animated: true)
    }
}
