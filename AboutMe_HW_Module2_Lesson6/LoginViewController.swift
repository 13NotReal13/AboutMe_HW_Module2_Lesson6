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
    
    private let user = "User"
    private let password = "1111"
    
    // MARK: Override funcs
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == user, passwordTextField.text == password else {
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
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.username = user
        
        passwordTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
    }
    
    // MARK: IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(withTitle: "OOPS!", andMesage: "Your username: \(user)")
            : showAlert(withTitle: "OOPS!", andMesage: "Your password: \(password)")
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
