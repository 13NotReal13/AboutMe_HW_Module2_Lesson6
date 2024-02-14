//
//  UserBioViewController.swift
//  AboutMe_HW_Module2_Lesson6
//
//  Created by Иван Семикин on 13/02/2024.
//

import UIKit

final class UserBioViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(user.person.name) \(user.person.surname)"
        bioLabel.text = user.person.biography
    }
}
