//
//  ViewController.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
  
    private let user = User.getUser()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutInfoViewController
                aboutVC.person = user.person
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        txtLogin.text = ""
        txtPassword.text = ""
    }
    
    @IBAction func actionForgotName(_ sender: UIButton) {
        showAlert(title: "Forgot User Name", for: "Your User Name is \(user.login)")
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
        showAlert(title: "Forgot Password", for: "Your Password is \(user.password)")
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        checkExistLoginAndPassword()
    }
    
}

//MARK: - private methods
extension LoginViewController {
    
    private func checkExistLoginAndPassword() {
        if let login = txtLogin.text,
           let password = txtPassword.text {
            checkLoginAndPassword(login: login.lowercased(), and: password)
        }
    }
    
    private func checkLoginAndPassword(login: String, and password: String) {
        if login != user.login || password != user.password {
            txtPassword.text = ""
            showAlert(title: "Error!",
                      for: "User name or Password is invalid.\nPlease try again.")
        } else {
            view.endEditing(true)
        }
    }
    
    private func showAlert(title: String, for text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtLogin {
            txtPassword.becomeFirstResponder()
        } else {
            checkExistLoginAndPassword()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }

        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
