//
//  LoginViewController.swift
//  FMIPractice
//
//  Created by Spas Bilyarski on 31.10.19.
//  Copyright © 2019 bilyarski. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    /// Текстово поле за въвеждане на потребителско име.
    @IBOutlet weak var usernameTextField: UITextField!
    
    /// Текстово поле за въвеждане на парола.
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Елемент, чрез който показваме на потребителя, че в момента се извъшва някаква комуникация или зареждане.
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /// Временна променлива, която се ползва за показването на `WelcomeViewController`.
    var loggedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// `Action` метода на бутона за вход.
    @IBAction func loginAction(_ sender: Any) {
        // Стартираме анимацията на `UIActivityIndicatorView` за да покажем на потребителите, че в момента тече комуникация с нашата имитация на сървър.
        activityIndicator.startAnimating()
        
        // Извикваме метода за вход от `UserManager`-а ни. `[weak self] in` - използваме слаба референция към текущият контролер за да избегнем проблемите, когато нашият контролер се деинициализира по време на комуникацията със сървър. В нашият случай работим само в една нишка (главната/main) и това няма да стане.
        UserManager.shared.logIn(username: usernameTextField.text!, password: passwordTextField.text!) { [weak self] (result) in
            // Проверяваме резултата от `logIn` метода.
            switch result {
            case .success(let user):
                self?.loggedUser = user
                
                // Извикваме `Segue`-а съдаден в "Main.storyboard" с идентификатора "showWelcome".
                self?.performSegue(withIdentifier: "showWelcome", sender: nil)
                
            case .failure(let error):
                print(error)
            }
            
            // Спираме анимацията. Вече не се комуникира със сървър.
            self?.activityIndicator.stopAnimating()
        }
    }
    
    /// Първоначалната имплементация на този метод не преви нищо. Наследниците могат да `override`-нат имплементацията на този метод за да конфигурират новият `ViewController` преди да бъде показан.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Преди да подадем данните за потребителя, проверяваме дали имаме запазени данни и дали подаваме данните към правилният контролер.
        guard let user = loggedUser, segue.identifier == "showWelcome", let destination = segue.destination as? WelcomeViewController else {
            return
        }

        destination.user = user
        
        // След подаването на нашият потребител, вече нямаме нужда от временната променлива.
        loggedUser = nil
    }
    
}

