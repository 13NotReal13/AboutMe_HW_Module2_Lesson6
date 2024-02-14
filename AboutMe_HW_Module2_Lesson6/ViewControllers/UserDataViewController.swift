//
//  UserDataViewController.swift
//  AboutMe_HW_Module2_Lesson6
//
//  Created by Иван Семикин on 13/02/2024.
//

import UIKit

final class UserDataViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var yearOfBirthLabel: UILabel!
    
    @IBOutlet var placeOfStudyLabel: UILabel!
    @IBOutlet var specialityLabel: UILabel!
    @IBOutlet var teacherLabel: UILabel!
    
    @IBOutlet var avatarImageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        yearOfBirthLabel.text = user.person.yearOfBirth
        
        placeOfStudyLabel.text = user.person.education.placeOfStudy
        specialityLabel.text = user.person.education.speciality
        teacherLabel.text = user.person.education.teacher
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userBioVC = segue.destination as? UserBioViewController {
            userBioVC.user = user
        }
    }
}
