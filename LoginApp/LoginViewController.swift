//
//  ViewController.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    private let trueLogin = "mylogin"
    private let truePassword = "Password1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtLogin.delegate = self
        txtPassword.delegate = self
    }
    
    @IBAction func actionForgotName(_ sender: UIButton) {
        showAlert(title: "Forgot User Name", for: "Your User Name is mylogin")
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
        showAlert(title: "Forgot Password", for: "Your Password is Password1")
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        checkExistLoginAndPassword()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.placeholder == "User name" {
            txtPassword.becomeFirstResponder()
        } else {
            checkExistLoginAndPassword()
        }

        return true
    }

    private func checkExistLoginAndPassword() {
        if let login = txtLogin.text,
           let password = txtPassword.text {
            checkLoginAndPassword(login: login.lowercased(), and: password)
        }
    }
    
    private func checkLoginAndPassword(login: String, and password: String) {
        if login == trueLogin && password == truePassword {
            
        } else {
            showAlert(title: "Error!",
                      for: "User name or Password is invalid.\nPlease try again.")
        }
    }
    
    private func showAlert(title: String, for text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}

