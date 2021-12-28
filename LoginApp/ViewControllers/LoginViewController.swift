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
  
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtPassword.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = txtLogin.text
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
