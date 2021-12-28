//
//  ImageViewController.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageUser: UIImageView!
    
    var titleImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
    }
    
}

//MARK: - private methods
extension ImageViewController {
    
    private func showImage() {
        if !titleImage.isEmpty {
            imageUser.image = UIImage(named: titleImage)
        }
    }
    
}
