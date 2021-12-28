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
    
    private let trueLogin = "mylogin"
    private let truePassword = "Password1"
    
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
        showAlert(title: "Forgot User Name", for: "Your User Name is \(trueLogin)")
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
        showAlert(title: "Forgot Password", for: "Your Password is \(truePassword)")
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
        if login != trueLogin || password != truePassword {
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
        if textField.placeholder == txtLogin.placeholder {
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
