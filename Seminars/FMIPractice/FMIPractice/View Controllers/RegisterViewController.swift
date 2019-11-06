//
//  RegisterViewController.swift
//  FMIPractice
//
//  Created by Spas Bilyarski on 31.10.19.
//  Copyright © 2019 bilyarski. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    /// Текстово поле за въвеждане на потребителско име.
    @IBOutlet weak var usernameTextField: UITextField!
    
    /// Текстово поле за въвеждане на парола.
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Текстово поле за повторно въвеждане на парола.
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// `Action` метода на бутона за регистрация.
    @IBAction func registerAction(_ sender: Any) {
        // Проверяваме дали въведените пароли съвпадат и разопаковаме текстовете на полетата за потребителско име и парола.
        guard passwordTextField.text == confirmPasswordTextField.text,
            let username = usernameTextField.text,
            let password = passwordTextField.text else {
            return
        }
        
        // Извикваме метода за регистрация от `UserManager`-а ни. За да разберете какво прави `[weak self] in` погледнете метода `loginAction` в `LoginViewController`.
        UserManager.shared.register(username: username, password: password) { [weak self] (user) in
            // Затваряме текущия контролер.
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    /// `Action` метода на X бутона.
    @IBAction func closeAction(_ sender: Any) {
        // Затваряме текущия контролер.
        dismiss(animated: true, completion: nil)
    }

}
