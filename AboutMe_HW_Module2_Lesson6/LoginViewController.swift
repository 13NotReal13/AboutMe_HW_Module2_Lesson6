//
//  ViewController.swift
//  AboutMe_HW_Module2_Lesson6
//
//  Created by Иван Семикин on 10/02/2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "User"
    private let password = "1111"
    
    // MARK: To hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcome = "Welcome, \(username)!"
    }
    
    // MARK: Validate data
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == username,
                passwordTextField.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMesage: "Please, enter correct login and password"
            )
            return false
        }
        
        return true
    }
    
    // MARK: Actions for buttons
    
    @IBAction func forgotUsernameButtonPressed() {
        showAlert(withTitle: "OOPS!", andMesage: "Your username: User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(withTitle: "OOPS!", andMesage: "Your password: 1111")
    }
    
    // MARK: Unwind
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
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
