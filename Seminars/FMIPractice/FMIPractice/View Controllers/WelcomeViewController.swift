//
//  WelcomeViewController.swift
//  FMIPractice
//
//  Created by Spas Bilyarski on 31.10.19.
//  Copyright © 2019 bilyarski. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    /// Променлива, която ще използваме за да подадем данните за потребителя при показването на този контролер.
    var user: User!
    
    /// Текст, който поздравява потребителят.
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Задаваме новият текст съдържащ потребителското име. Задаваме го в `viewDidLoad` защото в момента на `didSet` на `user` променливата нашият изглед все още не е зареден от сториборда, `welcomeLabel` няма да съществува още.
        welcomeLabel.text = "Welcome, \(user.username)!"
    }
    
    /// `Action` метода на X бутона.
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
