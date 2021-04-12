//
//  SignUpViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit	

class SignUpViewController: UIViewController {

    @IBOutlet weak var uiContanier: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        uiContanier.addCorner()
        uiContanier.dropShadow()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func uiBtnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
