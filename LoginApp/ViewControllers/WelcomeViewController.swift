//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var labelWelcomeUser: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWelcomeUser.text = "Welcome, \(userName ?? "")!"
    }
    
}
