//
//  WelcomeViewController.swift
//  AboutMe_HW_Module2_Lesson6
//
//  Created by Иван Семикин on 10/02/2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var greetingNameLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.login)!"
        greetingNameLabel.text = "My name is \(user.person.name) \(user.person.surname)."
    }

}
