//
//  AboutInfoViewController.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

import UIKit

class AboutInfoViewController: UIViewController {

    @IBOutlet weak var labelHobby: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = person.fullName
        
        showInfoOnForm()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.titleImage = person.image
    }
}

//MARK: - private methods
extension AboutInfoViewController {
    
    private func showInfoOnForm() {
        labelHobby.text = person.hobby
        labelAge.text = String(person.age)
        labelInfo.text = person.info
    }
    
}
